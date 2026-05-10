; DESCRIPTION: Renders a cyan disk with center (22, 139) and radius 17.
; PLAN: r0=22(x), r1=139(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 139
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
