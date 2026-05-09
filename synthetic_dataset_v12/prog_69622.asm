; DESCRIPTION: Composite: Draws a orange line from (491, 227) to (486, 231) then Draws a purple rectangle at (74, 23) with width 75 and height 39 then Places a cyan dot at position (36, 53).
; PLAN: r0=491(x1), r1=227(y1), r2=486(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=23(y), r7=75(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=36(x), r11=53(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 491
LDI r1, 227
LDI r2, 486
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 23
LDI r7, 75
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 53
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
