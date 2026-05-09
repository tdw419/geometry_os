; DESCRIPTION: Composite: Draws a green line from (418, 67) to (56, 63) then Places a orange 94x20 rectangle at position (322, 122) then Renders a purple disk with center (136, 154) and radius 56.
; PLAN: r0=418(x1), r1=67(y1), r2=56(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=122(y), r7=94(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=154(y), r12=56(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 67
LDI r2, 56
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 122
LDI r7, 94
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 154
LDI r12, 56
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
