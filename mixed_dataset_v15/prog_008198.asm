; DESCRIPTION: Composite: Places a orange dot at position (388, 54) then Draws a yellow circle centered at (395, 84) with radius 51.
; PLAN: r0=388(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=84(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 395
LDI r6, 84
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
