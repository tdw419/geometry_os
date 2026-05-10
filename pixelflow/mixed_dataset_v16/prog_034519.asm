; DESCRIPTION: Composite: Draws a green line from (157, 145) to (370, 164) then Places a black dot at position (173, 79) then Creates a orange circular shape at (46, 63) with radius 15.
; PLAN: r0=157(x1), r1=145(y1), r2=370(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=79(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=46(x), r11=63(y), r12=15(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 157
LDI r1, 145
LDI r2, 370
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 79
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 46
LDI r11, 63
LDI r12, 15
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
