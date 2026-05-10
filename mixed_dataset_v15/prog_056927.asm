; DESCRIPTION: Draws a yellow circle centered at (169, 219) with radius 27.
; PLAN: r0=169(x), r1=219(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 219
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
