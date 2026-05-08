; DESCRIPTION: Draws a red object at the screen with fixed size.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r14 = x position
;   r2 = y position
;   r1 = vx (velocity x)
;   r6 = vy (velocity y)
;   r8 = color (white)
;   r3 = scratch
;   r15 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r14, 32          ; start x = 32 (left half)
  LDI r2, 128         ; start y = 128
  LDI r1, 1           ; vx = +1
  LDI r6, 1           ; vy = +1
  LDI r8, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r15, red_proc
  SPAWN r15

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r3, 0
  PSET r14, r2, r3

  ; move
  ADD r14, r1
  ADD r2, r6

  ; bounce left wall (x = 0)
  LDI r3, 0
  CMP r14, r3
  JNZ r3, chk_rw
  LDI r1, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r3, 127
  CMP r14, r3
  JNZ r3, chk_tw
  LDI r1, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r3, 0
  CMP r2, r3
  JNZ r3, chk_bw
  LDI r6, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r3, 255
  CMP r2, r3
  JNZ r3, draw
  LDI r6, 0xFFFFFFFF

draw:
  PSET r14, r2, r8
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r14, 196         ; start x = 196 (right half)
  LDI r2, 64          ; start y = 64
  LDI r1, 0xFFFFFFFF          ; vx = -1
  LDI r6, 1           ; vy = +1
  LDI r8, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r3, 0
  PSET r14, r2, r3

  ; move
  ADD r14, r1
  ADD r2, r6

  ; bounce left wall of right half (x = 128)
  LDI r3, 128
  CMP r14, r3
  JNZ r3, red_chk_rw
  LDI r1, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r3, 255
  CMP r14, r3
  JNZ r3, red_chk_tw
  LDI r1, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r3, 0
  CMP r2, r3
  JNZ r3, red_chk_bw
  LDI r6, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r3, 255
  CMP r2, r3
  JNZ r3, red_draw
  LDI r6, 0xFFFFFFFF
red_draw:
  PSET r14, r2, r8
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
