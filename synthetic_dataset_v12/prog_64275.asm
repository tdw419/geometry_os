; DESCRIPTION: Composite: Sets a single magenta pixel at (251, 198) then Draws a orange circle centered at (254, 120) with radius 62.
; PLAN: r0=251(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=120(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 120
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
