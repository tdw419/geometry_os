; DESCRIPTION: Composite: Renders a cyan line between points (241, 188) and (72, 100) then Draws a orange rectangle at (369, 158) with width 68 and height 83.
; PLAN: r0=241(x1), r1=188(y1), r2=72(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=158(y), r7=68(width), r8=83(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 188
LDI r2, 72
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 158
LDI r7, 68
LDI r8, 83
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
