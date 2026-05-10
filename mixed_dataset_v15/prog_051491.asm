; DESCRIPTION: Places a magenta disk with center (306, 20) and radius 15.
; PLAN: r0=306(x), r1=20(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 20
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
