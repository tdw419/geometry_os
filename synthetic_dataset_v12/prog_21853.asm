; DESCRIPTION: Renders a cyan disk with center (258, 119) and radius 68.
; PLAN: r0=258(x), r1=119(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 119
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
