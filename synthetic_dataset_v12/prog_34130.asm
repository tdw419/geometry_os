; DESCRIPTION: Renders a red disk with center (427, 96) and radius 79.
; PLAN: r0=427(x), r1=96(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 96
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
