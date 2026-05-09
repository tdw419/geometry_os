; DESCRIPTION: Creates a magenta circular shape at (42, 86) with radius 38.
; PLAN: r0=42(x), r1=86(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 86
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
