; DESCRIPTION: Composite: Draws a purple line from (503, 20) to (367, 146) then Draws a blue circle centered at (135, 81) with radius 76 then Creates a orange rectangular region at (355, 44) spanning 94 by 117 pixels.
; PLAN: r0=503(x1), r1=20(y1), r2=367(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=81(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=44(y), r12=94(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 20
LDI r2, 367
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 81
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 44
LDI r12, 94
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
