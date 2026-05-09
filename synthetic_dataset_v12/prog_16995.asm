; DESCRIPTION: Composite: Creates a purple rectangular region at (8, 170) spanning 35 by 23 pixels then Renders a cyan disk with center (116, 70) and radius 38 then Draws a magenta line from (356, 3) to (436, 160).
; PLAN: r0=8(x), r1=170(y), r2=35(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=70(y), r7=38(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x1), r11=3(y1), r12=436(x2), r13=160(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 170
LDI r2, 35
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 70
LDI r7, 38
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 3
LDI r12, 436
LDI r13, 160
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
