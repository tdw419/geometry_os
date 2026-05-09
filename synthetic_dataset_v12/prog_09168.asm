; DESCRIPTION: Composite: Sets a single white pixel at (427, 52) then Draws a orange circle centered at (303, 132) with radius 54.
; PLAN: r0=427(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x), r6=132(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 427
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 132
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
