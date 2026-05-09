; DESCRIPTION: Composite: Renders a red disk with center (387, 132) and radius 52 then Draws a purple line from (414, 57) to (58, 251) then Draws a green rectangle at (328, 137) with width 92 and height 18.
; PLAN: r0=387(x), r1=132(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=57(y1), r7=58(x2), r8=251(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=137(y), r12=92(width), r13=18(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 132
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 57
LDI r7, 58
LDI r8, 251
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 137
LDI r12, 92
LDI r13, 18
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
