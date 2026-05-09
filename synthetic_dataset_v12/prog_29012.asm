; DESCRIPTION: Renders a red disk with center (332, 79) and radius 28.
; PLAN: r0=332(x), r1=79(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 79
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
