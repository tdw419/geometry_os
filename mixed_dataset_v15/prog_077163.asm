; DESCRIPTION: Renders a cyan circular shape at (130, 147) with radius 15.
; PLAN: r0=130(x), r1=147(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 147
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
