; DESCRIPTION: Composite: Places a white 51x113 rectangle at position (344, 119) then Renders a orange line between points (69, 192) and (244, 219) then Places a black dot at position (433, 211).
; PLAN: r0=344(x), r1=119(y), r2=51(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=192(y1), r7=244(x2), r8=219(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=433(x), r11=211(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 119
LDI r2, 51
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 192
LDI r7, 244
LDI r8, 219
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 211
LDI r12, 0x000000
PSET r10, r11, r12
HALT
