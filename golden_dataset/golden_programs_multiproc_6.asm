; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r11 = x position
;   r2 = y position
;   r0 = vx (velocity x)
;   r4 = vy (velocity y)
;   r7 = color (white)
;   r6 = scratch
;   r10 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r11, 32          ; start x = 32 (left half)
  LDI r2, 128         ; start y = 128
  LDI r0, 1           ; vx = +1
  LDI r4, 1           ; vy = +1
  LDI r7, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r10, red_proc
  SPAWN r10

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r6, 0
  PSET r11, r2, r6

  ; move
  ADD r11, r0
  ADD r2, r4

  ; bounce left wall (x = 0)
  LDI r6, 0
  CMP r11, r6
  JNZ r6, chk_rw
  LDI r0, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r6, 127
  CMP r11, r6
  JNZ r6, chk_tw
  LDI r0, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r6, 0
  CMP r2, r6
  JNZ r6, chk_bw
  LDI r4, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r6, 255
  CMP r2, r6
  JNZ r6, draw
  LDI r4, 0xFFFFFFFF

draw:
  PSET r11, r2, r7
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r11, 196         ; start x = 196 (right half)
  LDI r2, 64          ; start y = 64
  LDI r0, 0xFFFFFFFF          ; vx = -1
  LDI r4, 1           ; vy = +1
  LDI r7, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r6, 0
  PSET r11, r2, r6

  ; move
  ADD r11, r0
  ADD r2, r4

  ; bounce left wall of right half (x = 128)
  LDI r6, 128
  CMP r11, r6
  JNZ r6, red_chk_rw
  LDI r0, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r6, 255
  CMP r11, r6
  JNZ r6, red_chk_tw
  LDI r0, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r6, 0
  CMP r2, r6
  JNZ r6, red_chk_bw
  LDI r4, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r6, 255
  CMP r2, r6
  JNZ r6, red_draw
  LDI r4, 0xFFFFFFFF
red_draw:
  PSET r11, r2, r7
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
