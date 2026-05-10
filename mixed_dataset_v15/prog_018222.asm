; DESCRIPTION: Composite: Draws a green line from (229, 78) to (188, 86) then Creates a white rectangular region at (335, 125) spanning 39 by 98 pixels then Sets a single green pixel at (88, 63).
; PLAN: r0=229(x1), r1=78(y1), r2=188(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=125(y), r7=39(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=63(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 78
LDI r2, 188
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 125
LDI r7, 39
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 63
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
