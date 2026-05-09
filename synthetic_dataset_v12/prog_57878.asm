; DESCRIPTION: Composite: Draws a orange line from (166, 209) to (223, 255) then Renders a green box of size 97x12 starting at (403, 2) then Draws a black circle centered at (145, 84) with radius 44.
; PLAN: r0=166(x1), r1=209(y1), r2=223(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=2(y), r7=97(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=84(y), r12=44(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 209
LDI r2, 223
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 2
LDI r7, 97
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 84
LDI r12, 44
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
