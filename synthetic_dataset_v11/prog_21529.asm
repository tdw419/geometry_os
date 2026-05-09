; DESCRIPTION: Renders a cyan disk with center (144, 83) and radius 13.
; PLAN: r0=144(x), r1=83(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 83
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
