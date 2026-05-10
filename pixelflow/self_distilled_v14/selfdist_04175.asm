; DESCRIPTION: Renders a cyan circular shape at (366, 147) with radius 69.
; PLAN: r0=366(x), r1=147(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 147
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
