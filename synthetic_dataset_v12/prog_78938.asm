; DESCRIPTION: Creates a blue circular shape at (228, 123) with radius 19.
; PLAN: r0=228(x), r1=123(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 123
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
