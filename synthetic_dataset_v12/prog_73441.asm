; DESCRIPTION: Draws a black circle centered at (448, 154) with radius 10.
; PLAN: r0=448(x), r1=154(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 154
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
