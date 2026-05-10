; DESCRIPTION: Draws a red circle centered at (260, 217) with radius 26.
; PLAN: r0=260(x), r1=217(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 217
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
