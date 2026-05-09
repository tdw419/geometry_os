; DESCRIPTION: Renders a cyan disk with center (320, 84) and radius 62.
; PLAN: r0=320(x), r1=84(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 84
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
