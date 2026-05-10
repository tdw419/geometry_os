; DESCRIPTION: Composite: Sets a single black pixel at (391, 19) then Draws a yellow rectangle at (231, 98) with width 61 and height 89 then Draws a purple line from (123, 101) to (212, 151).
; PLAN: r0=391(x), r1=19(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=98(y), r7=61(width), r8=89(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x1), r11=101(y1), r12=212(x2), r13=151(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 19
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 98
LDI r7, 61
LDI r8, 89
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 101
LDI r12, 212
LDI r13, 151
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
