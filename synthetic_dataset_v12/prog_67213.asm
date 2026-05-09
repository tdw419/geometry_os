; DESCRIPTION: Composite: Places a black 64x82 rectangle at position (313, 111) then Draws a green line from (155, 245) to (470, 184) then Places a yellow circle of radius 13 at center (89, 189).
; PLAN: r0=313(x), r1=111(y), r2=64(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x1), r6=245(y1), r7=470(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=189(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 313
LDI r1, 111
LDI r2, 64
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 245
LDI r7, 470
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 189
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
