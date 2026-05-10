; DESCRIPTION: Renders a red disk with center (44, 192) and radius 38.
; PLAN: r0=44(x), r1=192(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 192
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
