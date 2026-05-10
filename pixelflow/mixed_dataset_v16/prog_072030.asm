; DESCRIPTION: Creates a magenta circular shape at (153, 96) with radius 20.
; PLAN: r0=153(x), r1=96(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 96
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
