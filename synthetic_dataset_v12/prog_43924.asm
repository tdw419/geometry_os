; DESCRIPTION: Composite: Draws a orange line from (180, 251) to (325, 151) then Creates a green rectangular region at (328, 85) spanning 86 by 109 pixels.
; PLAN: r0=180(x1), r1=251(y1), r2=325(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=85(y), r7=86(width), r8=109(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 251
LDI r2, 325
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 85
LDI r7, 86
LDI r8, 109
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
