; DESCRIPTION: Renders a black disk with center (202, 79) and radius 75.
; PLAN: r0=202(x), r1=79(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 79
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
