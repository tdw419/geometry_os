; DESCRIPTION: Renders a red disk with center (62, 149) and radius 60.
; PLAN: r0=62(x), r1=149(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 149
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
