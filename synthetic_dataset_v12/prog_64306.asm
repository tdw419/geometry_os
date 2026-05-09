; DESCRIPTION: Creates a purple circular shape at (294, 16) with radius 10.
; PLAN: r0=294(x), r1=16(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 16
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
