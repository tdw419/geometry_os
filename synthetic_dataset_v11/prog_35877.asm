; DESCRIPTION: Renders a cyan disk with center (119, 108) and radius 58.
; PLAN: r0=119(x), r1=108(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 108
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
