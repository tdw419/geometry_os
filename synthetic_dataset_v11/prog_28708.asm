; DESCRIPTION: Draws a cyan circle centered at (118, 147) with radius 62.
; PLAN: r0=118(x), r1=147(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 147
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
