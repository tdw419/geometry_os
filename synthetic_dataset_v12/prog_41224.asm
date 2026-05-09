; DESCRIPTION: Creates a blue circular shape at (166, 68) with radius 36.
; PLAN: r0=166(x), r1=68(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 68
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
