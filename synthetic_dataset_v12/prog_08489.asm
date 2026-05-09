; DESCRIPTION: Composite: Draws a magenta rectangle at (68, 65) with width 111 and height 76 then Creates a magenta circular shape at (85, 107) with radius 28 then Draws a magenta line from (322, 119) to (231, 128).
; PLAN: r0=68(x), r1=65(y), r2=111(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=107(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x1), r11=119(y1), r12=231(x2), r13=128(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 65
LDI r2, 111
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 107
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 119
LDI r12, 231
LDI r13, 128
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
