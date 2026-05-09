; DESCRIPTION: Renders a red disk with center (74, 118) and radius 35.
; PLAN: r0=74(x), r1=118(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 118
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
