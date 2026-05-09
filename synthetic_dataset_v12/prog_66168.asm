; DESCRIPTION: Composite: Draws a orange rectangle at (30, 96) with width 47 and height 66 then Places a magenta line segment connecting (468, 165) to (184, 147).
; PLAN: r0=30(x), r1=96(y), r2=47(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=165(y1), r7=184(x2), r8=147(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 96
LDI r2, 47
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 165
LDI r7, 184
LDI r8, 147
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
