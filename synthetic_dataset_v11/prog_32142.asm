; DESCRIPTION: Creates a magenta circular shape at (81, 122) with radius 74.
; PLAN: r0=81(x), r1=122(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 122
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
