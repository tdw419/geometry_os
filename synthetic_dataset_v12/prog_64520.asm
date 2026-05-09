; DESCRIPTION: Composite: Creates a blue rectangular region at (297, 3) spanning 32 by 99 pixels then Places a yellow dot at position (113, 136) then Draws a black line from (149, 48) to (231, 41).
; PLAN: r0=297(x), r1=3(y), r2=32(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=136(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=149(x1), r11=48(y1), r12=231(x2), r13=41(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 3
LDI r2, 32
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 136
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 149
LDI r11, 48
LDI r12, 231
LDI r13, 41
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
