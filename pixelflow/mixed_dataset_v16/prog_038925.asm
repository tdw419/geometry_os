; DESCRIPTION: Composite: Draws a green rectangle at (238, 109) with width 25 and height 68 then Sets a single cyan pixel at (163, 117).
; PLAN: r0=238(x), r1=109(y), r2=25(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 109
LDI r2, 25
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
