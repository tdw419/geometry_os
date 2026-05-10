; DESCRIPTION: Renders a red disk with center (191, 85) and radius 59.
; PLAN: r0=191(x), r1=85(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 85
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
