; DESCRIPTION: Composite: Creates a orange rectangular region at (359, 152) spanning 72 by 87 pixels then Places a yellow circle of radius 36 at center (391, 190) then Renders a yellow line between points (48, 197) and (200, 181).
; PLAN: r0=359(x), r1=152(y), r2=72(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=190(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x1), r11=197(y1), r12=200(x2), r13=181(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 152
LDI r2, 72
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 190
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 197
LDI r12, 200
LDI r13, 181
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
