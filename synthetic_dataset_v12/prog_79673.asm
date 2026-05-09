; DESCRIPTION: Creates a blue circular shape at (366, 42) with radius 22.
; PLAN: r0=366(x), r1=42(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 42
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
