; DESCRIPTION: Renders a red disk with center (241, 175) and radius 11.
; PLAN: r0=241(x), r1=175(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 175
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
