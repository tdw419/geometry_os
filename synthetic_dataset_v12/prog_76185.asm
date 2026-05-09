; DESCRIPTION: Creates a purple circular shape at (255, 115) with radius 63.
; PLAN: r0=255(x), r1=115(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 115
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
