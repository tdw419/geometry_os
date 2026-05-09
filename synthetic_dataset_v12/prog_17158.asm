; DESCRIPTION: Renders a cyan disk with center (147, 172) and radius 66.
; PLAN: r0=147(x), r1=172(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 172
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
