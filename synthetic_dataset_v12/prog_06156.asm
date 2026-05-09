; DESCRIPTION: Composite: Draws a magenta rectangle at (301, 81) with width 43 and height 119 then Places a magenta line segment connecting (52, 221) to (439, 145).
; PLAN: r0=301(x), r1=81(y), r2=43(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x1), r6=221(y1), r7=439(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 81
LDI r2, 43
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 221
LDI r7, 439
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
