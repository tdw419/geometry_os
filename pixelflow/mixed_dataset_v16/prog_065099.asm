; DESCRIPTION: Composite: Draws a green line from (46, 163) to (2, 24) then Renders a blue disk with center (272, 79) and radius 42 then Renders a yellow box of size 81x109 starting at (194, 133).
; PLAN: r0=46(x1), r1=163(y1), r2=2(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=79(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=133(y), r12=81(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 163
LDI r2, 2
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 79
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 133
LDI r12, 81
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
