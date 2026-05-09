; DESCRIPTION: Composite: Renders a cyan disk with center (347, 183) and radius 38 then Draws a purple line from (147, 37) to (188, 93) then Renders a orange box of size 55x91 starting at (0, 68).
; PLAN: r0=347(x), r1=183(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x1), r6=37(y1), r7=188(x2), r8=93(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=0(x), r11=68(y), r12=55(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 183
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 37
LDI r7, 188
LDI r8, 93
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 68
LDI r12, 55
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
