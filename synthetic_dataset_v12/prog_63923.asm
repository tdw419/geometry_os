; DESCRIPTION: Renders a cyan disk with center (411, 123) and radius 76.
; PLAN: r0=411(x), r1=123(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 123
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
