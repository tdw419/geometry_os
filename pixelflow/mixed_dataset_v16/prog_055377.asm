; DESCRIPTION: Renders a cyan disk with center (83, 192) and radius 62.
; PLAN: r0=83(x), r1=192(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 192
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
