; DESCRIPTION: Renders a red disk with center (140, 55) and radius 14.
; PLAN: r0=140(x), r1=55(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 55
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
