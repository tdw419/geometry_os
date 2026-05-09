; DESCRIPTION: Creates a magenta circular shape at (27, 34) with radius 10.
; PLAN: r0=27(x), r1=34(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 34
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
