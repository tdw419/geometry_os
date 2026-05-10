; DESCRIPTION: Composite: Draws a blue rectangle at (363, 198) with width 34 and height 26 then Sets a single cyan pixel at (13, 127).
; PLAN: r0=363(x), r1=198(y), r2=34(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=127(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 363
LDI r1, 198
LDI r2, 34
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 127
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
