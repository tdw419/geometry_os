; DESCRIPTION: Places a magenta disk with center (71, 118) and radius 14.
; PLAN: r0=71(x), r1=118(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 118
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
