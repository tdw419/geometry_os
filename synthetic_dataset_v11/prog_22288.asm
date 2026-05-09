; DESCRIPTION: Renders a cyan disk with center (194, 156) and radius 38.
; PLAN: r0=194(x), r1=156(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 156
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
