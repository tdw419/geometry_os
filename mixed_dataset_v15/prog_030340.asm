; DESCRIPTION: Composite: Sets a single magenta pixel at (279, 143) then Draws a white line from (256, 48) to (399, 32).
; PLAN: r0=279(x), r1=143(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=256(x1), r6=48(y1), r7=399(x2), r8=32(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 143
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 256
LDI r6, 48
LDI r7, 399
LDI r8, 32
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
