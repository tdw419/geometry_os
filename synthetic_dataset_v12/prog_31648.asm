; DESCRIPTION: Composite: Draws a orange circle centered at (83, 212) with radius 38 then Renders a purple line between points (368, 19) and (469, 43) then Renders a cyan box of size 94x67 starting at (372, 153).
; PLAN: r0=83(x), r1=212(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x1), r6=19(y1), r7=469(x2), r8=43(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=372(x), r11=153(y), r12=94(width), r13=67(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 212
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 19
LDI r7, 469
LDI r8, 43
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 153
LDI r12, 94
LDI r13, 67
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
