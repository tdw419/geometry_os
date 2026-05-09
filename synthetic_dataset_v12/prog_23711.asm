; DESCRIPTION: Composite: Draws a yellow rectangle at (120, 74) with width 55 and height 119 then Draws a orange line from (4, 53) to (236, 3).
; PLAN: r0=120(x), r1=74(y), r2=55(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x1), r6=53(y1), r7=236(x2), r8=3(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 74
LDI r2, 55
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 53
LDI r7, 236
LDI r8, 3
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
