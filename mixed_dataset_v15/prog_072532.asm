; DESCRIPTION: Composite: Draws a cyan line from (384, 87) to (9, 235) then Renders a green disk with center (272, 101) and radius 67 then Creates a yellow rectangular region at (102, 24) spanning 62 by 65 pixels.
; PLAN: r0=384(x1), r1=87(y1), r2=9(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=101(y), r7=67(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=24(y), r12=62(width), r13=65(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 87
LDI r2, 9
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 101
LDI r7, 67
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 24
LDI r12, 62
LDI r13, 65
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
