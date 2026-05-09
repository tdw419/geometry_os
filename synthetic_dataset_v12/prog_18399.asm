; DESCRIPTION: Composite: Renders a orange line between points (7, 83) and (117, 47) then Places a yellow 47x26 rectangle at position (99, 192) then Sets a single blue pixel at (466, 226).
; PLAN: r0=7(x1), r1=83(y1), r2=117(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=99(x), r6=192(y), r7=47(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x), r11=226(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 7
LDI r1, 83
LDI r2, 117
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 192
LDI r7, 47
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 226
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
