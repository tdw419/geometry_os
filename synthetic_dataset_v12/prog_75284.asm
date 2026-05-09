; DESCRIPTION: Creates a magenta circular shape at (415, 99) with radius 42.
; PLAN: r0=415(x), r1=99(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 99
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
