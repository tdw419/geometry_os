; DESCRIPTION: Composite: Draws a yellow line from (276, 56) to (67, 18) then Draws a orange rectangle at (9, 13) with width 114 and height 88 then Places a cyan dot at position (276, 244).
; PLAN: r0=276(x1), r1=56(y1), r2=67(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=13(y), r7=114(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=244(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 56
LDI r2, 67
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 13
LDI r7, 114
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 244
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
