; DESCRIPTION: Draws a red circle centered at (417, 89) with radius 34.
; PLAN: r0=417(x), r1=89(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 89
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
