; DESCRIPTION: Creates a magenta circular shape at (394, 106) with radius 30.
; PLAN: r0=394(x), r1=106(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 106
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
