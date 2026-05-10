; DESCRIPTION: Composite: Renders a orange line between points (468, 195) and (371, 128) then Draws a black circle centered at (30, 127) with radius 15 then Draws a white rectangle at (261, 66) with width 63 and height 46.
; PLAN: r0=468(x1), r1=195(y1), r2=371(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=127(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=261(x), r11=66(y), r12=63(width), r13=46(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 195
LDI r2, 371
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 127
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 261
LDI r11, 66
LDI r12, 63
LDI r13, 46
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
