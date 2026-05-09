; DESCRIPTION: Renders a red disk with center (99, 85) and radius 49.
; PLAN: r0=99(x), r1=85(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 85
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
