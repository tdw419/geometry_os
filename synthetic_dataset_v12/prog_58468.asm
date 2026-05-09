; DESCRIPTION: Composite: Renders a purple line between points (253, 98) and (176, 21) then Sets a single orange pixel at (304, 104) then Renders a black box of size 84x88 starting at (82, 158).
; PLAN: r0=253(x1), r1=98(y1), r2=176(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=104(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=82(x), r11=158(y), r12=84(width), r13=88(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 98
LDI r2, 176
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 104
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 82
LDI r11, 158
LDI r12, 84
LDI r13, 88
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
