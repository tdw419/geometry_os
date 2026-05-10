; DESCRIPTION: Draws a black circle centered at (123, 162) with radius 50.
; PLAN: r0=123(x), r1=162(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 162
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
