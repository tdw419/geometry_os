; DESCRIPTION: Draws a red circle centered at (97, 220) with radius 23.
; PLAN: r0=97(x), r1=220(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 220
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
