; DESCRIPTION: Places a magenta disk with center (306, 49) and radius 31.
; PLAN: r0=306(x), r1=49(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 49
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
