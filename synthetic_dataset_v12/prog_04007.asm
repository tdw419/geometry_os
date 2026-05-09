; DESCRIPTION: Composite: Places a blue line segment connecting (1, 103) to (132, 37) then Draws a magenta rectangle at (52, 140) with width 75 and height 97.
; PLAN: r0=1(x1), r1=103(y1), r2=132(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=140(y), r7=75(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 103
LDI r2, 132
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 140
LDI r7, 75
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
