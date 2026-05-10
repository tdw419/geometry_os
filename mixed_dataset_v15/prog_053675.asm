; DESCRIPTION: Composite: Draws a green rectangle at (331, 143) with width 75 and height 49 then Draws a white line from (11, 79) to (302, 126).
; PLAN: r0=331(x), r1=143(y), r2=75(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=79(y1), r7=302(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 143
LDI r2, 75
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 79
LDI r7, 302
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
