; DESCRIPTION: Composite: Renders a green line between points (390, 237) and (111, 214) then Places a orange circle of radius 20 at center (335, 153) then Places a orange 44x68 rectangle at position (444, 187).
; PLAN: r0=390(x1), r1=237(y1), r2=111(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=153(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=444(x), r11=187(y), r12=44(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 237
LDI r2, 111
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 153
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 444
LDI r11, 187
LDI r12, 44
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
