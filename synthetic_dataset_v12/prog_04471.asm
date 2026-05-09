; DESCRIPTION: Draws a yellow circle centered at (87, 52) with radius 20.
; PLAN: r0=87(x), r1=52(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 52
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
