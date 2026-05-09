; DESCRIPTION: Composite: Draws a yellow line from (130, 0) to (304, 92) then Places a green 102x58 rectangle at position (389, 127) then Renders a black disk with center (417, 119) and radius 72.
; PLAN: r0=130(x1), r1=0(y1), r2=304(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=127(y), r7=102(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=119(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 0
LDI r2, 304
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 127
LDI r7, 102
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 119
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
