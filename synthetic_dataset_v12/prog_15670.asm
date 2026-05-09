; DESCRIPTION: Renders a cyan disk with center (192, 104) and radius 43.
; PLAN: r0=192(x), r1=104(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 104
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
