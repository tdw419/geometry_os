; DESCRIPTION: Renders a red disk with center (241, 69) and radius 14.
; PLAN: r0=241(x), r1=69(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 69
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
