; DESCRIPTION: Composite: Draws a white line from (498, 181) to (259, 132) then Places a green dot at position (308, 157) then Places a red circle of radius 68 at center (184, 113).
; PLAN: r0=498(x1), r1=181(y1), r2=259(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=157(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=184(x), r11=113(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 181
LDI r2, 259
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 157
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 184
LDI r11, 113
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
