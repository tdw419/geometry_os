; DESCRIPTION: Creates a blue circular shape at (420, 174) with radius 42.
; PLAN: r0=420(x), r1=174(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 174
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
