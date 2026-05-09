; DESCRIPTION: Creates a blue circular shape at (42, 210) with radius 31.
; PLAN: r0=42(x), r1=210(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 210
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
