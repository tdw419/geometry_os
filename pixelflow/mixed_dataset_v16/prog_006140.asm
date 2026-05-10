; DESCRIPTION: Composite: Places a purple 47x26 rectangle at position (430, 114) then Places a orange line segment connecting (1, 147) to (231, 170) then Places a black dot at position (457, 253).
; PLAN: r0=430(x), r1=114(y), r2=47(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=147(y1), r7=231(x2), r8=170(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=457(x), r11=253(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 114
LDI r2, 47
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 147
LDI r7, 231
LDI r8, 170
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 253
LDI r12, 0x000000
PSET r10, r11, r12
HALT
