; DESCRIPTION: Draws a yellow circle centered at (48, 179) with radius 13.
; PLAN: r0=48(x), r1=179(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 179
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
