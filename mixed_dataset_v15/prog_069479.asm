; DESCRIPTION: Composite: Draws a cyan rectangle at (203, 107) with width 54 and height 33 then Renders a green line between points (438, 219) and (388, 97).
; PLAN: r0=203(x), r1=107(y), r2=54(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=219(y1), r7=388(x2), r8=97(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 107
LDI r2, 54
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 219
LDI r7, 388
LDI r8, 97
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
