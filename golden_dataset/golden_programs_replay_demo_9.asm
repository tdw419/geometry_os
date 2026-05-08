; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r2, 1         ; mode = start recording
  SNAP_TRACE r2      ; begin trace recording

  LDI r12, 0         ; frame counter
  LDI r11, 16        ; total frames to draw
  LDI r10, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r9, 0
  FILL r9

  ; Draw a vertical bar at position r10
  LDI r6, 0          ; y = 0
  LDI r14, 256        ; y limit
  LDI r8, 0x00FF00   ; green bar color
  LDI r15, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r10, r6)
  LDI r13, 0
bar_x:
  LDI r3, 0
  ADD r3, r10
  ADD r3, r13         ; x = bar_pos + offset
  SCREENP r3, r6, r8    ; set pixel
  LDI r1, 1
  ADD r13, r1
  CMP r13, r15
  BLT r5, bar_x

  LDI r1, 1
  ADD r6, r1
  CMP r6, r14
  BLT r5, bar_y

  ; Advance bar position
  LDI r1, 16
  ADD r10, r1

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r1, 1
  ADD r12, r1
  CMP r12, r11
  BLT r5, draw_loop

  ; Stop recording
  LDI r2, 0
  SNAP_TRACE r2

  ; Now replay backward: show frames from newest to oldest
  LDI r7, 0         ; replay index (0 = newest)

replay_loop:
  LDI r2, 0
  ADD r2, r7        ; frame index to replay
  REPLAY r2

  ; Small delay between replay frames
  LDI r4, 0
delay:
  LDI r0, 1
  ADD r4, r0
  CMP r4, r11       ; short delay
  BLT r5, delay

  LDI r1, 1
  ADD r7, r1
  CMP r7, r11       ; replay all 16 frames
  BLT r5, replay_loop

  HALT
