; DESCRIPTION: Composite: Draws a green rectangle at (93, 21) with width 39 and height 81 then Sets a single yellow pixel at (314, 6).
; PLAN: r0=93(x), r1=21(y), r2=39(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=6(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 21
LDI r2, 39
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 6
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
