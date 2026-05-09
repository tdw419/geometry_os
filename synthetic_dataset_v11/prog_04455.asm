; DESCRIPTION: Draws a yellow circle centered at (52, 27) with radius 22.
; PLAN: r0=52(x), r1=27(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 27
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
