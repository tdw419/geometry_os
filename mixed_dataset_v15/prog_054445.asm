; DESCRIPTION: Creates a magenta circular shape at (96, 165) with radius 38.
; PLAN: r0=96(x), r1=165(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 165
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
