; DESCRIPTION: Renders a cyan disk with center (76, 62) and radius 37.
; PLAN: r0=76(x), r1=62(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 62
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
