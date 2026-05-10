; DESCRIPTION: Renders a white circular shape at (133, 191) with radius 42.
; PLAN: r0=133(x), r1=191(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 191
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
