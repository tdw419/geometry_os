; DESCRIPTION: Creates a magenta circular shape at (160, 34) with radius 21.
; PLAN: r0=160(x), r1=34(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 34
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
