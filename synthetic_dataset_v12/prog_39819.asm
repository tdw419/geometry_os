; DESCRIPTION: Composite: Draws a blue line from (290, 172) to (388, 43) then Draws a orange rectangle at (25, 70) with width 107 and height 70.
; PLAN: r0=290(x1), r1=172(y1), r2=388(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=70(y), r7=107(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 172
LDI r2, 388
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 70
LDI r7, 107
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
