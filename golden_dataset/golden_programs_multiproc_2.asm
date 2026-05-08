; DESCRIPTION: Draws a red object at the screen with fixed size.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r4 = x position
;   r5 = y position
;   r12 = vx (velocity x)
;   r6 = vy (velocity y)
;   r13 = color (white)
;   r1 = scratch
;   r2 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r4, 32          ; start x = 32 (left half)
  LDI r5, 128         ; start y = 128
  LDI r12, 1           ; vx = +1
  LDI r6, 1           ; vy = +1
  LDI r13, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r2, red_proc
  SPAWN r2

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r1, 0
  PSET r4, r5, r1

  ; move
  ADD r4, r12
  ADD r5, r6

  ; bounce left wall (x = 0)
  LDI r1, 0
  CMP r4, r1
  JNZ r1, chk_rw
  LDI r12, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r1, 127
  CMP r4, r1
  JNZ r1, chk_tw
  LDI r12, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r1, 0
  CMP r5, r1
  JNZ r1, chk_bw
  LDI r6, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r1, 255
  CMP r5, r1
  JNZ r1, draw
  LDI r6, 0xFFFFFFFF

draw:
  PSET r4, r5, r13
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r4, 196         ; start x = 196 (right half)
  LDI r5, 64          ; start y = 64
  LDI r12, 0xFFFFFFFF          ; vx = -1
  LDI r6, 1           ; vy = +1
  LDI r13, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r1, 0
  PSET r4, r5, r1

  ; move
  ADD r4, r12
  ADD r5, r6

  ; bounce left wall of right half (x = 128)
  LDI r1, 128
  CMP r4, r1
  JNZ r1, red_chk_rw
  LDI r12, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r1, 255
  CMP r4, r1
  JNZ r1, red_chk_tw
  LDI r12, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r1, 0
  CMP r5, r1
  JNZ r1, red_chk_bw
  LDI r6, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r1, 255
  CMP r5, r1
  JNZ r1, red_draw
  LDI r6, 0xFFFFFFFF
red_draw:
  PSET r4, r5, r13
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
