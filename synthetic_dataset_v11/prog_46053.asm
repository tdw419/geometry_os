; DESCRIPTION: Composite: . Then Draws a orange circle centered at (147, 160) with radius 78. Then Sets a single cyan pixel at (119, 36).
; PLAN: r0=147(x), r1=160(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=119(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (147, 160) with radius 78.
; PLAN: r0=147(x), r1=160(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 160
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (119, 36).
; PLAN: r0=119(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 36
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
