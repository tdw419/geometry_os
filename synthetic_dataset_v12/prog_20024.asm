; DESCRIPTION: Composite: Draws a orange rectangle at (326, 84) with width 40 and height 85 then Sets a single black pixel at (184, 131).
; PLAN: r0=326(x), r1=84(y), r2=40(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=131(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 84
LDI r2, 40
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 131
LDI r7, 0x000000
PSET r5, r6, r7
HALT
