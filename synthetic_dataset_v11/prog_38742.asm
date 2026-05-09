; DESCRIPTION: Creates a purple circular shape at (191, 206) with radius 16.
; PLAN: r0=191(x), r1=206(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 206
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
