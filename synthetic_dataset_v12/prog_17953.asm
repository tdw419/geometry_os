; DESCRIPTION: Creates a white circular shape at (448, 205) with radius 36.
; PLAN: r0=448(x), r1=205(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 205
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
