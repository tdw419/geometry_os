; DESCRIPTION: Composite: Draws a black line from (186, 7) to (157, 4) then Places a green dot at position (103, 106) then Draws a magenta rectangle at (209, 117) with width 31 and height 29.
; PLAN: r0=186(x1), r1=7(y1), r2=157(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=106(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=117(y), r12=31(width), r13=29(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 7
LDI r2, 157
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 106
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 209
LDI r11, 117
LDI r12, 31
LDI r13, 29
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
