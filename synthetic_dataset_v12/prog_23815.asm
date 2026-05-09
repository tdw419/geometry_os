; DESCRIPTION: Creates a purple circular shape at (344, 168) with radius 63.
; PLAN: r0=344(x), r1=168(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 168
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
