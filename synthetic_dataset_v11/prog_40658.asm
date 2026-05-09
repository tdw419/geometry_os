; DESCRIPTION: Draws a black circle centered at (123, 220) with radius 36.
; PLAN: r0=123(x), r1=220(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 220
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
