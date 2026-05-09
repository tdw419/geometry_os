; DESCRIPTION: Renders a red disk with center (246, 106) and radius 18.
; PLAN: r0=246(x), r1=106(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 106
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
