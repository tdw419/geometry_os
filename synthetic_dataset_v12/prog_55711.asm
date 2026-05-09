; DESCRIPTION: Renders a cyan disk with center (67, 78) and radius 45.
; PLAN: r0=67(x), r1=78(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 78
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
