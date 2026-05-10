; DESCRIPTION: Draws a cyan circle centered at (12, 147) with radius 79.
; PLAN: r0=12(x), r1=147(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 12
LDI r1, 147
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
