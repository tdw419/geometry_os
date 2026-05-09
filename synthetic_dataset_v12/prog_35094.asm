; DESCRIPTION: Composite: Draws a magenta rectangle at (94, 114) with width 106 and height 90 then Draws a white line from (72, 16) to (2, 91).
; PLAN: r0=94(x), r1=114(y), r2=106(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x1), r6=16(y1), r7=2(x2), r8=91(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 114
LDI r2, 106
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 16
LDI r7, 2
LDI r8, 91
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
