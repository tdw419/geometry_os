; DESCRIPTION: Composite: Draws a magenta rectangle at (281, 120) with width 75 and height 83 then Places a blue line segment connecting (406, 185) to (251, 94).
; PLAN: r0=281(x), r1=120(y), r2=75(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=185(y1), r7=251(x2), r8=94(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 120
LDI r2, 75
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 185
LDI r7, 251
LDI r8, 94
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
