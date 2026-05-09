; DESCRIPTION: Renders a red disk with center (342, 102) and radius 74.
; PLAN: r0=342(x), r1=102(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 102
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
