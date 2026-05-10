; DESCRIPTION: Composite: Draws a black rectangle at (146, 45) with width 23 and height 77 then Sets a single black pixel at (55, 94).
; PLAN: r0=146(x), r1=45(y), r2=23(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=94(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 45
LDI r2, 23
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 94
LDI r7, 0x000000
PSET r5, r6, r7
HALT
