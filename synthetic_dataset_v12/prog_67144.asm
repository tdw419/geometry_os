; DESCRIPTION: Renders a cyan disk with center (478, 126) and radius 26.
; PLAN: r0=478(x), r1=126(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 126
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
