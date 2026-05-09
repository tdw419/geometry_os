; DESCRIPTION: Creates a magenta circular shape at (130, 95) with radius 21.
; PLAN: r0=130(x), r1=95(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 95
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
