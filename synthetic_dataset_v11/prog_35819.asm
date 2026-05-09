; DESCRIPTION: Renders a red disk with center (120, 79) and radius 43.
; PLAN: r0=120(x), r1=79(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 79
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
