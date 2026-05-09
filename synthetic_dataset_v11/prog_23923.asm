; DESCRIPTION: Renders a cyan disk with center (189, 78) and radius 26.
; PLAN: r0=189(x), r1=78(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 78
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
