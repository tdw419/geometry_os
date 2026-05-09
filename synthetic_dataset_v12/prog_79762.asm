; DESCRIPTION: Composite: Draws a purple rectangle at (69, 26) with width 82 and height 114 then Draws a yellow line from (123, 195) to (311, 223) then Places a cyan circle of radius 29 at center (466, 98).
; PLAN: r0=69(x), r1=26(y), r2=82(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=195(y1), r7=311(x2), r8=223(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=98(y), r12=29(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 26
LDI r2, 82
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 195
LDI r7, 311
LDI r8, 223
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 98
LDI r12, 29
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
