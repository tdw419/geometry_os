; DESCRIPTION: Display a object using color red at the screen.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r9 = x position
;   r3 = y position
;   r0 = vx (velocity x)
;   r12 = vy (velocity y)
;   r15 = color (white)
;   r7 = scratch
;   r4 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r9, 32          ; start x = 32 (left half)
  LDI r3, 128         ; start y = 128
  LDI r0, 1           ; vx = +1
  LDI r12, 1           ; vy = +1
  LDI r15, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r4, red_proc
  SPAWN r4

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r7, 0
  PSET r9, r3, r7

  ; move
  ADD r9, r0
  ADD r3, r12

  ; bounce left wall (x = 0)
  LDI r7, 0
  CMP r9, r7
  JNZ r7, chk_rw
  LDI r0, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r7, 127
  CMP r9, r7
  JNZ r7, chk_tw
  LDI r0, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r7, 0
  CMP r3, r7
  JNZ r7, chk_bw
  LDI r12, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r7, 255
  CMP r3, r7
  JNZ r7, draw
  LDI r12, 0xFFFFFFFF

draw:
  PSET r9, r3, r15
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r9, 196         ; start x = 196 (right half)
  LDI r3, 64          ; start y = 64
  LDI r0, 0xFFFFFFFF          ; vx = -1
  LDI r12, 1           ; vy = +1
  LDI r15, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r7, 0
  PSET r9, r3, r7

  ; move
  ADD r9, r0
  ADD r3, r12

  ; bounce left wall of right half (x = 128)
  LDI r7, 128
  CMP r9, r7
  JNZ r7, red_chk_rw
  LDI r0, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r7, 255
  CMP r9, r7
  JNZ r7, red_chk_tw
  LDI r0, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r7, 0
  CMP r3, r7
  JNZ r7, red_chk_bw
  LDI r12, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r7, 255
  CMP r3, r7
  JNZ r7, red_draw
  LDI r12, 0xFFFFFFFF
red_draw:
  PSET r9, r3, r15
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
