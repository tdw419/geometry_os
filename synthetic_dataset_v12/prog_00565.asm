; DESCRIPTION: Renders a red disk with center (166, 110) and radius 11.
; PLAN: r0=166(x), r1=110(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 110
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
