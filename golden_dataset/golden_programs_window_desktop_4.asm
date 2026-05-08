; DESCRIPTION: This GeOS assembly code implements a multi-window desktop environment with three windows titled "Hello," "Counter," and "Colors." It demonstrates the integration of window management (WINSYS) and mouse input (MOUSEQ) systems, allowing users to drag windows by clicking on their title bars, focus on them by clicking elsewhere, and quit the application by pressing 'Q'. Each window has its own content rendering logic: a green background with "Hello," a blue background with an animated counter bar, and a continuously changing color stripe pattern. The code also includes a main loop that handles mouse movement for dragging windows and updates the window contents at specific intervals to create animations.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r2, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r3, 0x2000
STRO r3, "Hello"
LDI r3, 0x2020
STRO r3, "Counter"
LDI r3, 0x2040
STRO r3, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r7, 20
LDI r6, 20
LDI r4, 100
LDI r0, 80
LDI r12, 0x2000     ; title addr
LDI r3, 0          ; op=0 (create)
WINSYS r3
MOV r14, r1        ; r14 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r7, 140
LDI r6, 30
LDI r4, 100
LDI r0, 80
LDI r12, 0x2020
LDI r3, 0
WINSYS r3
MOV r15, r1        ; r15 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r7, 60
LDI r6, 120
LDI r4, 100
LDI r0, 80
LDI r12, 0x2040
LDI r3, 0
WINSYS r3
MOV r8, r1        ; r8 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r11 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r11, 0
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
  LDI r3, 4         ; op=4 (hittest)
  WINSYS r3         ; r1=win_id, r7=hit_type

  ; If no hit, skip
  JZ r1, no_click_action

  ; Bring clicked window to front
  LDI r3, 2         ; op=2 (bring to front)
  WINSYS r3

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r7, r25       ; r7 = hit_type from hittest
  JNZ r1, no_click_action

  ; Start dragging (title bar hit)
  MOV r11, r1       ; r11 = dragging win_id

  ; Get window info for drag offset
  MOV r1, r11
  LDI r7, 0x9000    ; winfo dest addr
  LDI r3, 6         ; op=6 (winfo)
  WINSYS r3

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
  JZ r11, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r1, r11       ; win_id
  MOV r7, r21
  SUB r7, r16       ; new_x = mx - drag_ox
  MOV r6, r22
  SUB r6, r17       ; new_y = my - drag_oy
  LDI r3, 5         ; op=5 (moveto)
  WINSYS r3

  JMP no_click_action

stop_drag:
  LDI r11, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r2       ; counter++
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
  MOV r1, r14
  CALL draw_window_frame

  ; Window 2 border
  MOV r1, r15
  CALL draw_window_frame

  ; Window 3 border
  MOV r1, r8
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r1
  MOV r1, r14       ; win_id

  ; Fill with dark green
  LDI r4, 0x003300  ; dark green
  LDI r0, 0         ; y
fill1_loop:
  LDI r3, 0         ; x
fill1_x:
  WPIXEL r1, r3, r0, r4
  ADD r3, r2        ; x++
  LDI r25, 100
  CMP r3, r25
  BLT r1, fill1_x
  ADD r0, r2        ; y++
  LDI r25, 80
  CMP r0, r25
  BLT r1, fill1_loop

  ; Draw a bright green H in the center
  LDI r4, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r0, 30
  LDI r3, 40
h_left:
  WPIXEL r1, r3, r0, r4
  WPIXEL r1, r3, r0, r4
  ADD r0, r2
  LDI r25, 60
  CMP r0, r25
  BLT r1, h_left

  ; Right vertical of H
  LDI r0, 30
  LDI r3, 48
h_right:
  WPIXEL r1, r3, r0, r4
  ADD r0, r2
  LDI r25, 60
  CMP r0, r25
  BLT r1, h_right

  ; Crossbar of H
  LDI r0, 44
  LDI r3, 40
h_bar:
  WPIXEL r1, r3, r0, r4
  ADD r3, r2
  LDI r25, 49
  CMP r3, r25
  BLT r1, h_bar

  POP r1
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r1

  MOV r1, r15       ; win_id

  ; Fill with dark blue
  LDI r4, 0x000033  ; dark blue
  LDI r0, 0
fill2_loop:
  LDI r3, 0
fill2_x:
  WPIXEL r1, r3, r0, r4
  ADD r3, r2
  LDI r25, 100
  CMP r3, r25
  BLT r1, fill2_x
  ADD r0, r2
  LDI r25, 80
  CMP r0, r25
  BLT r1, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r4, 0xFFFFFF  ; white
  LDI r0, 40        ; y position
  MOV r12, r18
  LDI r25, 90
  MOD r12, r25
  ADD r12, r2        ; +1 = at least 1 pixel
  LDI r3, 5         ; x offset
bar_loop:
  CMP r3, r12
  BGE r1, bar_done
  WPIXEL r1, r3, r0, r4
  ADD r3, r2
  JMP bar_loop
bar_done:

  POP r1
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r1
  PUSH r7
  PUSH r6

  MOV r1, r8       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r0, 0         ; y
stripe_y:
  LDI r3, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r7, r3
  ADD r7, r26       ; x + ticks
  LDI r25, 31
  AND r7, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r7, r25       ; 0-93
  LDI r25, 8
  SHL r7, r25       ; shift into green channel
  MOV r4, r0
  LDI r6, 7
  AND r4, r6        ; y & 7
  LDI r25, 16
  SHL r4, r25       ; red channel
  OR r7, r4         ; combine
  MOV r4, r7

  WPIXEL r1, r3, r0, r4
  ADD r3, r2        ; x++
  LDI r25, 100
  CMP r3, r25
  BLT r1, stripe_x

  ADD r0, r2        ; y++
  LDI r25, 80
  CMP r0, r25
  BLT r1, stripe_y

  POP r6
  POP r7
  POP r1
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r1 = win_id
draw_window_frame:
  PUSH r31
  PUSH r1
  PUSH r7
  PUSH r6
  PUSH r4
  PUSH r0
  PUSH r12
  PUSH r3

  ; Get window info
  MOV r1, r1
  LDI r7, 0x9200    ; winfo addr
  LDI r3, 6         ; WINFO
  WINSYS r3
  JZ r1, frame_done  ; window not found

  LOAD r6, 0x9200   ; win_x
  LOAD r4, 0x9201   ; win_y
  LOAD r0, 0x9202   ; win_w
  LOAD r12, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r7, 0x444488
  MOV r3, r4         ; y = win_y
title_y:
  MOV r1, r6         ; x = win_x
title_x:
  PSET r1, r3, r7
  ADD r1, r2
  MOV r25, r6
  ADD r25, r0        ; x limit
  CMP r1, r25
  BLT r1, title_x
  ADD r3, r2
  LDI r25, 12
  ADD r25, r4        ; y limit (win_y + 12)
  CMP r3, r25
  BLT r1, title_y

  ; Border outline (gray)
  LDI r7, 0x888888
  ; Left + right edges
  MOV r1, r4         ; y = win_y
border_y:
  PSET r6, r1, r7    ; left edge
  MOV r25, r6
  ADD r25, r0
  SUB r25, r2        ; right edge x
  PSET r25, r1, r7
  ADD r1, r2
  MOV r25, r4
  ADD r25, r12
  CMP r1, r25
  BLT r1, border_y

  ; Bottom edge
  MOV r1, r4
  ADD r1, r12
  SUB r1, r2         ; bottom y
  MOV r3, r6         ; x = win_x
bottom_x:
  PSET r3, r1, r7
  ADD r3, r2
  MOV r25, r6
  ADD r25, r0
  CMP r3, r25
  BLT r1, bottom_x

frame_done:
  POP r3
  POP r12
  POP r0
  POP r4
  POP r6
  POP r7
  POP r1
  POP r31
  RET
