; DESCRIPTION: Composite: Places a yellow dot at position (62, 228) then Places a yellow line segment connecting (476, 14) to (369, 138) then Places a blue 101x72 rectangle at position (132, 12).
; PLAN: r0=62(x), r1=228(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=14(y1), r7=369(x2), r8=138(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=12(y), r12=101(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 228
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 476
LDI r6, 14
LDI r7, 369
LDI r8, 138
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 12
LDI r12, 101
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
