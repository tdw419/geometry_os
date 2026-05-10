; DESCRIPTION: Renders a cyan disk with center (192, 117) and radius 69.
; PLAN: r0=192(x), r1=117(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 117
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
