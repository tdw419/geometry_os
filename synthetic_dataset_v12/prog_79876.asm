; DESCRIPTION: Creates a blue circular shape at (231, 69) with radius 42.
; PLAN: r0=231(x), r1=69(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 69
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
