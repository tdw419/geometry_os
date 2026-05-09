; DESCRIPTION: Composite: Draws a cyan line from (479, 153) to (430, 67) then Draws a purple rectangle at (227, 87) with width 41 and height 44 then Places a red dot at position (154, 188).
; PLAN: r0=479(x1), r1=153(y1), r2=430(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=87(y), r7=41(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=188(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 479
LDI r1, 153
LDI r2, 430
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 87
LDI r7, 41
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 188
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
