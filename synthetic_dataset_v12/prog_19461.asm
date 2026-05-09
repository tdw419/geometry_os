; DESCRIPTION: Composite: Creates a blue rectangular region at (330, 139) spanning 61 by 87 pixels then Draws a orange line from (201, 46) to (313, 192) then Places a black dot at position (107, 122).
; PLAN: r0=330(x), r1=139(y), r2=61(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=46(y1), r7=313(x2), r8=192(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=122(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 139
LDI r2, 61
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 46
LDI r7, 313
LDI r8, 192
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 122
LDI r12, 0x000000
PSET r10, r11, r12
HALT
