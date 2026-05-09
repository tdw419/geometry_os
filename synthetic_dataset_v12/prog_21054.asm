; DESCRIPTION: Renders a red disk with center (287, 79) and radius 35.
; PLAN: r0=287(x), r1=79(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 79
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
