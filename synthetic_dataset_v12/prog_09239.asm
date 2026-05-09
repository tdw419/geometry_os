; DESCRIPTION: Composite: Draws a green rectangle at (276, 163) with width 83 and height 50 then Draws a white line from (297, 70) to (190, 210).
; PLAN: r0=276(x), r1=163(y), r2=83(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=70(y1), r7=190(x2), r8=210(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 163
LDI r2, 83
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 70
LDI r7, 190
LDI r8, 210
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
