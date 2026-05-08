; DESCRIPTION: Geometry OS program to draw a colored object.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r9, 1         ; mode = start recording
  SNAP_TRACE r9      ; begin trace recording

  LDI r6, 0         ; frame counter
  LDI r4, 16        ; total frames to draw
  LDI r13, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r2, 0
  FILL r2

  ; Draw a vertical bar at position r13
  LDI r5, 0          ; y = 0
  LDI r10, 256        ; y limit
  LDI r8, 0x00FF00   ; green bar color
  LDI r1, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r13, r5)
  LDI r3, 0
bar_x:
  LDI r12, 0
  ADD r12, r13
  ADD r12, r3         ; x = bar_pos + offset
  SCREENP r12, r5, r8    ; set pixel
  LDI r15, 1
  ADD r3, r15
  CMP r3, r1
  BLT r7, bar_x

  LDI r15, 1
  ADD r5, r15
  CMP r5, r10
  BLT r7, bar_y

  ; Advance bar position
  LDI r15, 16
  ADD r13, r15

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r15, 1
  ADD r6, r15
  CMP r6, r4
  BLT r7, draw_loop

  ; Stop recording
  LDI r9, 0
  SNAP_TRACE r9

  ; Now replay backward: show frames from newest to oldest
  LDI r0, 0         ; replay index (0 = newest)

replay_loop:
  LDI r9, 0
  ADD r9, r0        ; frame index to replay
  REPLAY r9

  ; Small delay between replay frames
  LDI r14, 0
delay:
  LDI r11, 1
  ADD r14, r11
  CMP r14, r4       ; short delay
  BLT r7, delay

  LDI r15, 1
  ADD r0, r15
  CMP r0, r4       ; replay all 16 frames
  BLT r7, replay_loop

  HALT
