; DESCRIPTION: Draws a cyan circle centered at (216, 147) with radius 26.
; PLAN: r0=216(x), r1=147(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 147
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
