; DESCRIPTION: Renders a cyan disk with center (192, 144) and radius 63.
; PLAN: r0=192(x), r1=144(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 144
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
