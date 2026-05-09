; DESCRIPTION: Composite: Places a purple 65x113 rectangle at position (398, 13) then Renders a purple line between points (355, 59) and (496, 128) then Places a orange dot at position (18, 197).
; PLAN: r0=398(x), r1=13(y), r2=65(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=59(y1), r7=496(x2), r8=128(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=18(x), r11=197(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 13
LDI r2, 65
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 59
LDI r7, 496
LDI r8, 128
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 197
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
