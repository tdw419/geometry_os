; DESCRIPTION: Creates a blue circular shape at (330, 115) with radius 63.
; PLAN: r0=330(x), r1=115(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 115
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
