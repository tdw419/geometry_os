; DESCRIPTION: Composite: Places a blue dot at position (484, 133) then Draws a orange circle centered at (86, 145) with radius 71.
; PLAN: r0=484(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=145(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 484
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 145
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
