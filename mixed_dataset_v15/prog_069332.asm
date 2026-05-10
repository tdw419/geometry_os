; DESCRIPTION: Composite: Draws a white line from (98, 216) to (35, 170) then Sets a single purple pixel at (301, 86) then Draws a blue rectangle at (203, 41) with width 12 and height 50.
; PLAN: r0=98(x1), r1=216(y1), r2=35(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=86(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=41(y), r12=12(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 216
LDI r2, 35
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 86
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 41
LDI r12, 12
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
