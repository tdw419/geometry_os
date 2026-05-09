; DESCRIPTION: Composite: Places a blue 54x73 rectangle at position (111, 40) then Sets a single yellow pixel at (172, 221) then Draws a yellow line from (157, 48) to (489, 129).
; PLAN: r0=111(x), r1=40(y), r2=54(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=221(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=157(x1), r11=48(y1), r12=489(x2), r13=129(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 40
LDI r2, 54
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 221
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 157
LDI r11, 48
LDI r12, 489
LDI r13, 129
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
