; DESCRIPTION: Composite: . Then Draws a blue circle centered at (212, 129) with radius 41. Then Sets a single red pixel at (176, 13).
; PLAN: r0=212(x), r1=129(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=176(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (212, 129) with radius 41.
; PLAN: r0=212(x), r1=129(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 129
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (176, 13).
; PLAN: r0=176(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
