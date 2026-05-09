; DESCRIPTION: Renders a cyan disk with center (176, 78) and radius 71.
; PLAN: r0=176(x), r1=78(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 78
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
