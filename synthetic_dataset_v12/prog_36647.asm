; DESCRIPTION: Composite: Draws a blue rectangle at (363, 106) with width 52 and height 106 then Sets a single black pixel at (491, 80).
; PLAN: r0=363(x), r1=106(y), r2=52(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=80(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 363
LDI r1, 106
LDI r2, 52
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 80
LDI r7, 0x000000
PSET r5, r6, r7
HALT
