; DESCRIPTION: Creates a purple circular shape at (144, 168) with radius 64.
; PLAN: r0=144(x), r1=168(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 168
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
