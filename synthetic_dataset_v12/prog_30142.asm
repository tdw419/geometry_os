; DESCRIPTION: Creates a blue circular shape at (212, 126) with radius 42.
; PLAN: r0=212(x), r1=126(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 126
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
