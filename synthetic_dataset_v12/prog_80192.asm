; DESCRIPTION: Composite: Places a yellow line segment connecting (493, 122) to (105, 150) then Draws a magenta rectangle at (50, 98) with width 44 and height 102.
; PLAN: r0=493(x1), r1=122(y1), r2=105(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=98(y), r7=44(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 122
LDI r2, 105
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 98
LDI r7, 44
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
