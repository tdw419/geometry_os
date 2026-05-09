; DESCRIPTION: Composite: Draws a green line from (430, 165) to (126, 67) then Draws a white rectangle at (142, 119) with width 98 and height 29 then Sets a single red pixel at (301, 175).
; PLAN: r0=430(x1), r1=165(y1), r2=126(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=119(y), r7=98(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=175(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 165
LDI r2, 126
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 119
LDI r7, 98
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 175
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
