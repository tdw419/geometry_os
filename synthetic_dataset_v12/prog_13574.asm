; DESCRIPTION: Composite: Places a white line segment connecting (211, 147) to (326, 236) then Draws a yellow rectangle at (178, 123) with width 68 and height 62.
; PLAN: r0=211(x1), r1=147(y1), r2=326(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=123(y), r7=68(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 147
LDI r2, 326
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 123
LDI r7, 68
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
