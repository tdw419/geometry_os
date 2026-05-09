; DESCRIPTION: Renders a red disk with center (164, 158) and radius 55.
; PLAN: r0=164(x), r1=158(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 158
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
