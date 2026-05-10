; DESCRIPTION: Composite: Places a yellow line segment connecting (79, 66) to (452, 74) then Draws a purple rectangle at (281, 67) with width 98 and height 59.
; PLAN: r0=79(x1), r1=66(y1), r2=452(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=67(y), r7=98(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 66
LDI r2, 452
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 67
LDI r7, 98
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
