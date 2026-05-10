; DESCRIPTION: Composite: Draws a orange line from (326, 128) to (188, 240) then Creates a red rectangular region at (255, 129) spanning 20 by 96 pixels then Renders a red disk with center (427, 59) and radius 13.
; PLAN: r0=326(x1), r1=128(y1), r2=188(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=129(y), r7=20(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x), r11=59(y), r12=13(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 128
LDI r2, 188
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 129
LDI r7, 20
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 59
LDI r12, 13
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
