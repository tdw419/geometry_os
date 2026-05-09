; DESCRIPTION: Composite: Renders a red disk with center (313, 62) and radius 16 then Draws a yellow line from (307, 94) to (122, 98) then Creates a black rectangular region at (369, 9) spanning 32 by 68 pixels.
; PLAN: r0=313(x), r1=62(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=94(y1), r7=122(x2), r8=98(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=9(y), r12=32(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 62
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 94
LDI r7, 122
LDI r8, 98
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 9
LDI r12, 32
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
