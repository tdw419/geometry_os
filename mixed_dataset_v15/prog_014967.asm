; DESCRIPTION: Renders a red disk with center (303, 116) and radius 78.
; PLAN: r0=303(x), r1=116(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 116
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
