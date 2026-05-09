; DESCRIPTION: Renders a cyan disk with center (142, 147) and radius 39.
; PLAN: r0=142(x), r1=147(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 147
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
