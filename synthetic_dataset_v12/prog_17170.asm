; DESCRIPTION: Composite: Draws a yellow line from (251, 203) to (432, 209) then Renders a black box of size 83x116 starting at (25, 79) then Draws a orange circle centered at (210, 218) with radius 11.
; PLAN: r0=251(x1), r1=203(y1), r2=432(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=79(y), r7=83(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=218(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 203
LDI r2, 432
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 79
LDI r7, 83
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 218
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
