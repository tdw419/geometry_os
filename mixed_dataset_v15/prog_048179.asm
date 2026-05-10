; DESCRIPTION: Creates a magenta circular shape at (463, 153) with radius 20.
; PLAN: r0=463(x), r1=153(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 153
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
