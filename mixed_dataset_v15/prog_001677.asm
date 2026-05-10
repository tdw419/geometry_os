; DESCRIPTION: Draws a cyan circle centered at (458, 147) with radius 25.
; PLAN: r0=458(x), r1=147(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 147
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
