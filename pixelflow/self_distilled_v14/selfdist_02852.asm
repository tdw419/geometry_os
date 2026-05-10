; DESCRIPTION: Draws a green circle centered at (10, 46) with radius 36.
; PLAN: r0=10(x), r1=46(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 10
LDI r1, 46
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
