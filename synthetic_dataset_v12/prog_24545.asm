; DESCRIPTION: Composite: Places a green line segment connecting (112, 71) to (377, 98) then Draws a orange rectangle at (126, 119) with width 71 and height 88.
; PLAN: r0=112(x1), r1=71(y1), r2=377(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=119(y), r7=71(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 71
LDI r2, 377
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 119
LDI r7, 71
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
