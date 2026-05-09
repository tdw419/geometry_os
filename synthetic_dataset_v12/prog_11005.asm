; DESCRIPTION: Renders a red disk with center (192, 134) and radius 37.
; PLAN: r0=192(x), r1=134(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 134
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
