; DESCRIPTION: Composite: Draws a red rectangle at (323, 144) with width 71 and height 80 then Renders a blue line between points (25, 149) and (506, 148).
; PLAN: r0=323(x), r1=144(y), r2=71(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x1), r6=149(y1), r7=506(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 144
LDI r2, 71
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 149
LDI r7, 506
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
