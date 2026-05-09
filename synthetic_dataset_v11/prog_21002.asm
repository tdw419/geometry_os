; DESCRIPTION: Renders a red disk with center (75, 79) and radius 50.
; PLAN: r0=75(x), r1=79(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 79
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
