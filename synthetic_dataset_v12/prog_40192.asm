; DESCRIPTION: Composite: Draws a purple rectangle at (244, 153) with width 41 and height 100 then Renders a blue line between points (213, 85) and (479, 81).
; PLAN: r0=244(x), r1=153(y), r2=41(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=85(y1), r7=479(x2), r8=81(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 153
LDI r2, 41
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 85
LDI r7, 479
LDI r8, 81
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
