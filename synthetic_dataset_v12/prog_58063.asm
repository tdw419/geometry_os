; DESCRIPTION: Renders a cyan disk with center (255, 147) and radius 40.
; PLAN: r0=255(x), r1=147(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 147
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
