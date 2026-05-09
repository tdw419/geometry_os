; DESCRIPTION: Renders a cyan disk with center (248, 178) and radius 76.
; PLAN: r0=248(x), r1=178(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 178
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
