; DESCRIPTION: This GeOS assembly code implements a multi-window desktop environment with three windows titled "Hello," "Counter," and "Colors." It demonstrates the integration of window management (WINSYS) and mouse input (MOUSEQ) systems, allowing users to drag windows by clicking on their title bars, focus on them by clicking elsewhere, and quit the application by pressing 'Q'. Each window has its own content rendering logic: a green background with "Hello," a blue background with an animated counter bar, and a continuously changing color stripe pattern. The code also includes a main loop that handles mouse movement for dragging windows and updates the window contents at specific intervals to create animations.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r15, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r10, 0x2000
STRO r10, "Hello"
LDI r10, 0x2020
STRO r10, "Counter"
LDI r10, 0x2040
STRO r10, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r11, 20
LDI r9, 20
LDI r5, 100
LDI r3, 80
LDI r2, 0x2000     ; title addr
LDI r10, 0          ; op=0 (create)
WINSYS r10
MOV r1, r7        ; r1 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r11, 140
LDI r9, 30
LDI r5, 100
LDI r3, 80
LDI r2, 0x2020
LDI r10, 0
WINSYS r10
MOV r13, r7        ; r13 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r11, 60
LDI r9, 120
LDI r5, 100
LDI r3, 80
LDI r2, 0x2040
LDI r10, 0
WINSYS r10
MOV r14, r7        ; r14 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r0 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r0, 0
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
  JZ r7, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r7, check_drag

  ; Fresh click -- do hittest
  LDI r10, 4         ; op=4 (hittest)
  WINSYS r10         ; r7=win_id, r11=hit_type

  ; If no hit, skip
  JZ r7, no_click_action

  ; Bring clicked window to front
  LDI r10, 2         ; op=2 (bring to front)
  WINSYS r10

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r11, r25       ; r11 = hit_type from hittest
  JNZ r7, no_click_action

  ; Start dragging (title bar hit)
  MOV r0, r7       ; r0 = dragging win_id

  ; Get window info for drag offset
  MOV r7, r0
  LDI r11, 0x9000    ; winfo dest addr
  LDI r10, 6         ; op=6 (winfo)
  WINSYS r10

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
  JZ r0, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r7, r0       ; win_id
  MOV r11, r21
  SUB r11, r16       ; new_x = mx - drag_ox
  MOV r9, r22
  SUB r9, r17       ; new_y = my - drag_oy
  LDI r10, 5         ; op=5 (moveto)
  WINSYS r10

  JMP no_click_action

stop_drag:
  LDI r0, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r15       ; counter++
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
  MOV r7, r1
  CALL draw_window_frame

  ; Window 2 border
  MOV r7, r13
  CALL draw_window_frame

  ; Window 3 border
  MOV r7, r14
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r7
  MOV r7, r1       ; win_id

  ; Fill with dark green
  LDI r5, 0x003300  ; dark green
  LDI r3, 0         ; y
fill1_loop:
  LDI r10, 0         ; x
fill1_x:
  WPIXEL r7, r10, r3, r5
  ADD r10, r15        ; x++
  LDI r25, 100
  CMP r10, r25
  BLT r7, fill1_x
  ADD r3, r15        ; y++
  LDI r25, 80
  CMP r3, r25
  BLT r7, fill1_loop

  ; Draw a bright green H in the center
  LDI r5, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r3, 30
  LDI r10, 40
h_left:
  WPIXEL r7, r10, r3, r5
  WPIXEL r7, r10, r3, r5
  ADD r3, r15
  LDI r25, 60
  CMP r3, r25
  BLT r7, h_left

  ; Right vertical of H
  LDI r3, 30
  LDI r10, 48
h_right:
  WPIXEL r7, r10, r3, r5
  ADD r3, r15
  LDI r25, 60
  CMP r3, r25
  BLT r7, h_right

  ; Crossbar of H
  LDI r3, 44
  LDI r10, 40
h_bar:
  WPIXEL r7, r10, r3, r5
  ADD r10, r15
  LDI r25, 49
  CMP r10, r25
  BLT r7, h_bar

  POP r7
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r7

  MOV r7, r13       ; win_id

  ; Fill with dark blue
  LDI r5, 0x000033  ; dark blue
  LDI r3, 0
fill2_loop:
  LDI r10, 0
fill2_x:
  WPIXEL r7, r10, r3, r5
  ADD r10, r15
  LDI r25, 100
  CMP r10, r25
  BLT r7, fill2_x
  ADD r3, r15
  LDI r25, 80
  CMP r3, r25
  BLT r7, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r5, 0xFFFFFF  ; white
  LDI r3, 40        ; y position
  MOV r2, r18
  LDI r25, 90
  MOD r2, r25
  ADD r2, r15        ; +1 = at least 1 pixel
  LDI r10, 5         ; x offset
bar_loop:
  CMP r10, r2
  BGE r7, bar_done
  WPIXEL r7, r10, r3, r5
  ADD r10, r15
  JMP bar_loop
bar_done:

  POP r7
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r7
  PUSH r11
  PUSH r9

  MOV r7, r14       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r3, 0         ; y
stripe_y:
  LDI r10, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r11, r10
  ADD r11, r26       ; x + ticks
  LDI r25, 31
  AND r11, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r11, r25       ; 0-93
  LDI r25, 8
  SHL r11, r25       ; shift into green channel
  MOV r5, r3
  LDI r9, 7
  AND r5, r9        ; y & 7
  LDI r25, 16
  SHL r5, r25       ; red channel
  OR r11, r5         ; combine
  MOV r5, r11

  WPIXEL r7, r10, r3, r5
  ADD r10, r15        ; x++
  LDI r25, 100
  CMP r10, r25
  BLT r7, stripe_x

  ADD r3, r15        ; y++
  LDI r25, 80
  CMP r3, r25
  BLT r7, stripe_y

  POP r9
  POP r11
  POP r7
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r7 = win_id
draw_window_frame:
  PUSH r31
  PUSH r7
  PUSH r11
  PUSH r9
  PUSH r5
  PUSH r3
  PUSH r2
  PUSH r10

  ; Get window info
  MOV r7, r7
  LDI r11, 0x9200    ; winfo addr
  LDI r10, 6         ; WINFO
  WINSYS r10
  JZ r7, frame_done  ; window not found

  LOAD r9, 0x9200   ; win_x
  LOAD r5, 0x9201   ; win_y
  LOAD r3, 0x9202   ; win_w
  LOAD r2, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r11, 0x444488
  MOV r10, r5         ; y = win_y
title_y:
  MOV r7, r9         ; x = win_x
title_x:
  PSET r7, r10, r11
  ADD r7, r15
  MOV r25, r9
  ADD r25, r3        ; x limit
  CMP r7, r25
  BLT r7, title_x
  ADD r10, r15
  LDI r25, 12
  ADD r25, r5        ; y limit (win_y + 12)
  CMP r10, r25
  BLT r7, title_y

  ; Border outline (gray)
  LDI r11, 0x888888
  ; Left + right edges
  MOV r7, r5         ; y = win_y
border_y:
  PSET r9, r7, r11    ; left edge
  MOV r25, r9
  ADD r25, r3
  SUB r25, r15        ; right edge x
  PSET r25, r7, r11
  ADD r7, r15
  MOV r25, r5
  ADD r25, r2
  CMP r7, r25
  BLT r7, border_y

  ; Bottom edge
  MOV r7, r5
  ADD r7, r2
  SUB r7, r15         ; bottom y
  MOV r10, r9         ; x = win_x
bottom_x:
  PSET r10, r7, r11
  ADD r10, r15
  MOV r25, r9
  ADD r25, r3
  CMP r10, r25
  BLT r7, bottom_x

frame_done:
  POP r10
  POP r2
  POP r3
  POP r5
  POP r9
  POP r11
  POP r7
  POP r31
  RET
