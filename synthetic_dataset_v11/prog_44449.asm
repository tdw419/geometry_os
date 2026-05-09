; DESCRIPTION: Draws a yellow circle centered at (112, 150) with radius 56.
; PLAN: r0=112(x), r1=150(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 150
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
