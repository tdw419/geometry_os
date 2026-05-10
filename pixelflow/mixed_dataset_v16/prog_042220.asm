; DESCRIPTION: Composite: Places a orange line segment connecting (66, 229) to (461, 97) then Places a yellow dot at position (191, 244) then Draws a blue rectangle at (21, 79) with width 10 and height 72.
; PLAN: r0=66(x1), r1=229(y1), r2=461(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=21(x), r11=79(y), r12=10(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 229
LDI r2, 461
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 21
LDI r11, 79
LDI r12, 10
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
