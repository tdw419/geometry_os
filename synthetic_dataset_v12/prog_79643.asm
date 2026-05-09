; DESCRIPTION: Creates a purple circular shape at (225, 60) with radius 42.
; PLAN: r0=225(x), r1=60(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 60
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
