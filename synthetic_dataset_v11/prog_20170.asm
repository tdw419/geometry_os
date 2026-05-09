; DESCRIPTION: Composite: . Then Draws a orange circle centered at (123, 106) with radius 74. Then Sets a single white pixel at (147, 26).
; PLAN: r0=123(x), r1=106(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (123, 106) with radius 74.
; PLAN: r0=123(x), r1=106(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 106
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (147, 26).
; PLAN: r0=147(x), r1=26(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 26
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
