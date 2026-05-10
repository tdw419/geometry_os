; DESCRIPTION: Composite: Renders a cyan line between points (404, 172) and (158, 83) then Renders a green disk with center (137, 51) and radius 50 then Draws a green rectangle at (162, 65) with width 72 and height 117.
; PLAN: r0=404(x1), r1=172(y1), r2=158(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=51(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=65(y), r12=72(width), r13=117(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 172
LDI r2, 158
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 51
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 65
LDI r12, 72
LDI r13, 117
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
