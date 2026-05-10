; DESCRIPTION: Composite: Draws a orange rectangle at (286, 61) with width 80 and height 82 then Sets a single cyan pixel at (118, 80).
; PLAN: r0=286(x), r1=61(y), r2=80(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=80(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 61
LDI r2, 80
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 80
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
