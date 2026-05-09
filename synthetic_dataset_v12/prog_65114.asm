; DESCRIPTION: Composite: Draws a blue line from (43, 46) to (359, 88) then Draws a green rectangle at (460, 149) with width 25 and height 77.
; PLAN: r0=43(x1), r1=46(y1), r2=359(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=149(y), r7=25(width), r8=77(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 46
LDI r2, 359
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 149
LDI r7, 25
LDI r8, 77
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
