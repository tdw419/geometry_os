; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r10, 1         ; mode = start recording
  SNAP_TRACE r10      ; begin trace recording

  LDI r13, 0         ; frame counter
  LDI r4, 16        ; total frames to draw
  LDI r3, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r2, 0
  FILL r2

  ; Draw a vertical bar at position r3
  LDI r1, 0          ; y = 0
  LDI r15, 256        ; y limit
  LDI r7, 0x00FF00   ; green bar color
  LDI r9, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r3, r1)
  LDI r14, 0
bar_x:
  LDI r11, 0
  ADD r11, r3
  ADD r11, r14         ; x = bar_pos + offset
  SCREENP r11, r1, r7    ; set pixel
  LDI r5, 1
  ADD r14, r5
  CMP r14, r9
  BLT r8, bar_x

  LDI r5, 1
  ADD r1, r5
  CMP r1, r15
  BLT r8, bar_y

  ; Advance bar position
  LDI r5, 16
  ADD r3, r5

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r5, 1
  ADD r13, r5
  CMP r13, r4
  BLT r8, draw_loop

  ; Stop recording
  LDI r10, 0
  SNAP_TRACE r10

  ; Now replay backward: show frames from newest to oldest
  LDI r6, 0         ; replay index (0 = newest)

replay_loop:
  LDI r10, 0
  ADD r10, r6        ; frame index to replay
  REPLAY r10

  ; Small delay between replay frames
  LDI r12, 0
delay:
  LDI r0, 1
  ADD r12, r0
  CMP r12, r4       ; short delay
  BLT r8, delay

  LDI r5, 1
  ADD r6, r5
  CMP r6, r4       ; replay all 16 frames
  BLT r8, replay_loop

  HALT
