; DESCRIPTION: Composite: Draws a red rectangle at (474, 156) with width 13 and height 24 then Places a green line segment connecting (276, 57) to (248, 189).
; PLAN: r0=474(x), r1=156(y), r2=13(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=57(y1), r7=248(x2), r8=189(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 474
LDI r1, 156
LDI r2, 13
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 57
LDI r7, 248
LDI r8, 189
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
