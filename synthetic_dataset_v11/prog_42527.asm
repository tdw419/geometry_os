; DESCRIPTION: Creates a white circular shape at (63, 68) with radius 32.
; PLAN: r0=63(x), r1=68(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 68
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
