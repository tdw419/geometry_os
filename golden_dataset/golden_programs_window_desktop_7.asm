; DESCRIPTION: This GeOS assembly code implements a multi-window desktop environment with three windows titled "Hello," "Counter," and "Colors." It demonstrates the integration of window management (WINSYS) and mouse input (MOUSEQ) systems, allowing users to drag windows by clicking on their title bars, focus on them by clicking elsewhere, and quit the application by pressing 'Q'. Each window has its own content rendering logic: a green background with "Hello," a blue background with an animated counter bar, and a continuously changing color stripe pattern. The code also includes a main loop that handles mouse movement for dragging windows and updates the window contents at specific intervals to create animations.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r5, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r9, 0x2000
STRO r9, "Hello"
LDI r9, 0x2020
STRO r9, "Counter"
LDI r9, 0x2040
STRO r9, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r4, 20
LDI r11, 20
LDI r3, 100
LDI r7, 80
LDI r0, 0x2000     ; title addr
LDI r9, 0          ; op=0 (create)
WINSYS r9
MOV r10, r1        ; r10 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r4, 140
LDI r11, 30
LDI r3, 100
LDI r7, 80
LDI r0, 0x2020
LDI r9, 0
WINSYS r9
MOV r8, r1        ; r8 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r4, 60
LDI r11, 120
LDI r3, 100
LDI r7, 80
LDI r0, 0x2040
LDI r9, 0
WINSYS r9
MOV r12, r1        ; r12 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r13 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r13, 0
LDI r16, 0
LDI r17, 0

; ── Counter for window 2 ──
LDI r18, 0         ; counter value

; ── Main loop ──
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state: r21=mx, r22=my, r23=btn
  MOUSEQ r21

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r1, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r1, check_drag

  ; Fresh click -- do hittest
  LDI r9, 4         ; op=4 (hittest)
  WINSYS r9         ; r1=win_id, r4=hit_type

  ; If no hit, skip
  JZ r1, no_click_action

  ; Bring clicked window to front
  LDI r9, 2         ; op=2 (bring to front)
  WINSYS r9

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r4, r25       ; r4 = hit_type from hittest
  JNZ r1, no_click_action

  ; Start dragging (title bar hit)
  MOV r13, r1       ; r13 = dragging win_id

  ; Get window info for drag offset
  MOV r1, r13
  LDI r4, 0x9000    ; winfo dest addr
  LDI r9, 6         ; op=6 (winfo)
  WINSYS r9

  ; drag_ox = mouse_x - win_x
  LOAD r25, 0x9000  ; win_x
  MOV r26, r21
  SUB r26, r25      ; mx - win_x
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LOAD r25, 0x9001  ; win_y
  MOV r26, r22
  SUB r26, r25      ; my - win_y
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r13, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r1, r13       ; win_id
  MOV r4, r21
  SUB r4, r16       ; new_x = mx - drag_ox
  MOV r11, r22
  SUB r11, r17       ; new_y = my - drag_oy
  LDI r9, 5         ; op=5 (moveto)
  WINSYS r9

  JMP no_click_action

stop_drag:
  LDI r13, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r5       ; counter++
  CALL draw_win2    ; redraw with new counter
skip_counter:

  ; ── Animate colors window (~4/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25
  LDI r27, 15
  AND r26, r27
  JNZ r26, skip_colors
  CALL draw_win3
skip_colors:

  ; ── Draw window borders and title bars on screen ──
  ; Window 1 border
  MOV r1, r10
  CALL draw_window_frame

  ; Window 2 border
  MOV r1, r8
  CALL draw_window_frame

  ; Window 3 border
  MOV r1, r12
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r1
  MOV r1, r10       ; win_id

  ; Fill with dark green
  LDI r3, 0x003300  ; dark green
  LDI r7, 0         ; y
fill1_loop:
  LDI r9, 0         ; x
fill1_x:
  WPIXEL r1, r9, r7, r3
  ADD r9, r5        ; x++
  LDI r25, 100
  CMP r9, r25
  BLT r1, fill1_x
  ADD r7, r5        ; y++
  LDI r25, 80
  CMP r7, r25
  BLT r1, fill1_loop

  ; Draw a bright green H in the center
  LDI r3, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r7, 30
  LDI r9, 40
h_left:
  WPIXEL r1, r9, r7, r3
  WPIXEL r1, r9, r7, r3
  ADD r7, r5
  LDI r25, 60
  CMP r7, r25
  BLT r1, h_left

  ; Right vertical of H
  LDI r7, 30
  LDI r9, 48
h_right:
  WPIXEL r1, r9, r7, r3
  ADD r7, r5
  LDI r25, 60
  CMP r7, r25
  BLT r1, h_right

  ; Crossbar of H
  LDI r7, 44
  LDI r9, 40
h_bar:
  WPIXEL r1, r9, r7, r3
  ADD r9, r5
  LDI r25, 49
  CMP r9, r25
  BLT r1, h_bar

  POP r1
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r1

  MOV r1, r8       ; win_id

  ; Fill with dark blue
  LDI r3, 0x000033  ; dark blue
  LDI r7, 0
fill2_loop:
  LDI r9, 0
fill2_x:
  WPIXEL r1, r9, r7, r3
  ADD r9, r5
  LDI r25, 100
  CMP r9, r25
  BLT r1, fill2_x
  ADD r7, r5
  LDI r25, 80
  CMP r7, r25
  BLT r1, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r3, 0xFFFFFF  ; white
  LDI r7, 40        ; y position
  MOV r0, r18
  LDI r25, 90
  MOD r0, r25
  ADD r0, r5        ; +1 = at least 1 pixel
  LDI r9, 5         ; x offset
bar_loop:
  CMP r9, r0
  BGE r1, bar_done
  WPIXEL r1, r9, r7, r3
  ADD r9, r5
  JMP bar_loop
bar_done:

  POP r1
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r1
  PUSH r4
  PUSH r11

  MOV r1, r12       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r7, 0         ; y
stripe_y:
  LDI r9, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r4, r9
  ADD r4, r26       ; x + ticks
  LDI r25, 31
  AND r4, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r4, r25       ; 0-93
  LDI r25, 8
  SHL r4, r25       ; shift into green channel
  MOV r3, r7
  LDI r11, 7
  AND r3, r11        ; y & 7
  LDI r25, 16
  SHL r3, r25       ; red channel
  OR r4, r3         ; combine
  MOV r3, r4

  WPIXEL r1, r9, r7, r3
  ADD r9, r5        ; x++
  LDI r25, 100
  CMP r9, r25
  BLT r1, stripe_x

  ADD r7, r5        ; y++
  LDI r25, 80
  CMP r7, r25
  BLT r1, stripe_y

  POP r11
  POP r4
  POP r1
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r1 = win_id
draw_window_frame:
  PUSH r31
  PUSH r1
  PUSH r4
  PUSH r11
  PUSH r3
  PUSH r7
  PUSH r0
  PUSH r9

  ; Get window info
  MOV r1, r1
  LDI r4, 0x9200    ; winfo addr
  LDI r9, 6         ; WINFO
  WINSYS r9
  JZ r1, frame_done  ; window not found

  LOAD r11, 0x9200   ; win_x
  LOAD r3, 0x9201   ; win_y
  LOAD r7, 0x9202   ; win_w
  LOAD r0, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r4, 0x444488
  MOV r9, r3         ; y = win_y
title_y:
  MOV r1, r11         ; x = win_x
title_x:
  PSET r1, r9, r4
  ADD r1, r5
  MOV r25, r11
  ADD r25, r7        ; x limit
  CMP r1, r25
  BLT r1, title_x
  ADD r9, r5
  LDI r25, 12
  ADD r25, r3        ; y limit (win_y + 12)
  CMP r9, r25
  BLT r1, title_y

  ; Border outline (gray)
  LDI r4, 0x888888
  ; Left + right edges
  MOV r1, r3         ; y = win_y
border_y:
  PSET r11, r1, r4    ; left edge
  MOV r25, r11
  ADD r25, r7
  SUB r25, r5        ; right edge x
  PSET r25, r1, r4
  ADD r1, r5
  MOV r25, r3
  ADD r25, r0
  CMP r1, r25
  BLT r1, border_y

  ; Bottom edge
  MOV r1, r3
  ADD r1, r0
  SUB r1, r5         ; bottom y
  MOV r9, r11         ; x = win_x
bottom_x:
  PSET r9, r1, r4
  ADD r9, r5
  MOV r25, r11
  ADD r25, r7
  CMP r9, r25
  BLT r1, bottom_x

frame_done:
  POP r9
  POP r0
  POP r7
  POP r3
  POP r11
  POP r4
  POP r1
  POP r31
  RET
