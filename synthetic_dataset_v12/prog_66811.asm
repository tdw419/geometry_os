; DESCRIPTION: Composite: Draws a green rectangle at (339, 40) with width 84 and height 48 then Draws a magenta line from (449, 122) to (10, 199) then Places a red dot at position (66, 163).
; PLAN: r0=339(x), r1=40(y), r2=84(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x1), r6=122(y1), r7=10(x2), r8=199(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=163(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 339
LDI r1, 40
LDI r2, 84
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 122
LDI r7, 10
LDI r8, 199
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 163
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
