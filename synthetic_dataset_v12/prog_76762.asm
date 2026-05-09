; DESCRIPTION: Creates a magenta circular shape at (306, 115) with radius 66.
; PLAN: r0=306(x), r1=115(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 115
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
