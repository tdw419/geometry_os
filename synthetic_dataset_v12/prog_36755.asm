; DESCRIPTION: Draws a yellow circle centered at (356, 53) with radius 10.
; PLAN: r0=356(x), r1=53(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 53
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
