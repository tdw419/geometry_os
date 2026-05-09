; DESCRIPTION: Composite: Draws a green rectangle at (108, 166) with width 60 and height 33 then Places a black line segment connecting (423, 172) to (146, 127).
; PLAN: r0=108(x), r1=166(y), r2=60(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=172(y1), r7=146(x2), r8=127(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 166
LDI r2, 60
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 172
LDI r7, 146
LDI r8, 127
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
