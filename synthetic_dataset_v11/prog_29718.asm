; DESCRIPTION: Creates a magenta circular shape at (100, 174) with radius 10.
; PLAN: r0=100(x), r1=174(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 174
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
