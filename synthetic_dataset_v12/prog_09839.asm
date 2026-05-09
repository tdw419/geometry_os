; DESCRIPTION: Composite: Draws a yellow line from (106, 70) to (491, 5) then Places a blue dot at position (6, 89) then Places a orange 35x16 rectangle at position (347, 164).
; PLAN: r0=106(x1), r1=70(y1), r2=491(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=89(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=347(x), r11=164(y), r12=35(width), r13=16(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 70
LDI r2, 491
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 89
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 164
LDI r12, 35
LDI r13, 16
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
