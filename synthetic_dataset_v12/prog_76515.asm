; DESCRIPTION: Composite: Places a purple dot at position (419, 39) then Creates a orange circular shape at (326, 97) with radius 45 then Draws a cyan line from (430, 134) to (501, 119).
; PLAN: r0=419(x), r1=39(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=97(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x1), r11=134(y1), r12=501(x2), r13=119(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 39
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 97
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 134
LDI r12, 501
LDI r13, 119
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
