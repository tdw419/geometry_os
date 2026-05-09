; DESCRIPTION: Renders a red disk with center (117, 77) and radius 66.
; PLAN: r0=117(x), r1=77(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 77
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
