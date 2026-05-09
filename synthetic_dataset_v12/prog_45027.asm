; DESCRIPTION: Composite: Draws a red rectangle at (306, 136) with width 108 and height 84 then Places a cyan line segment connecting (21, 73) to (39, 56) then Renders a green disk with center (273, 92) and radius 75.
; PLAN: r0=306(x), r1=136(y), r2=108(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=73(y1), r7=39(x2), r8=56(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=92(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 136
LDI r2, 108
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 73
LDI r7, 39
LDI r8, 56
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 92
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
