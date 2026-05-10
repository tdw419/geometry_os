; DESCRIPTION: Composite: Draws a white rectangle at (412, 133) with width 50 and height 63 then Renders a red line between points (315, 15) and (309, 157).
; PLAN: r0=412(x), r1=133(y), r2=50(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=15(y1), r7=309(x2), r8=157(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 133
LDI r2, 50
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 15
LDI r7, 309
LDI r8, 157
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
