; DESCRIPTION: Composite: Renders a purple line between points (169, 46) and (87, 102) then Draws a yellow rectangle at (252, 121) with width 76 and height 116.
; PLAN: r0=169(x1), r1=46(y1), r2=87(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=121(y), r7=76(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 46
LDI r2, 87
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 121
LDI r7, 76
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
