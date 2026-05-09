; DESCRIPTION: Composite: Draws a blue rectangle at (267, 148) with width 98 and height 56 then Places a black line segment connecting (292, 78) to (106, 197).
; PLAN: r0=267(x), r1=148(y), r2=98(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x1), r6=78(y1), r7=106(x2), r8=197(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 148
LDI r2, 98
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 78
LDI r7, 106
LDI r8, 197
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
