; DESCRIPTION: Composite: Draws a orange rectangle at (376, 106) with width 70 and height 55 then Sets a single cyan pixel at (136, 157).
; PLAN: r0=376(x), r1=106(y), r2=70(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 106
LDI r2, 70
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
