; DESCRIPTION: Composite: Draws a purple rectangle at (326, 39) with width 97 and height 25 then Places a orange line segment connecting (72, 120) to (281, 107) then Sets a single cyan pixel at (341, 149).
; PLAN: r0=326(x), r1=39(y), r2=97(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x1), r6=120(y1), r7=281(x2), r8=107(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=149(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 39
LDI r2, 97
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 120
LDI r7, 281
LDI r8, 107
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 149
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
