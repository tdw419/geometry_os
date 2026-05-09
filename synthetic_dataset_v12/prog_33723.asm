; DESCRIPTION: Creates a blue circular shape at (259, 159) with radius 50.
; PLAN: r0=259(x), r1=159(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 159
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
