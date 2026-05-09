; DESCRIPTION: Composite: Places a purple dot at position (212, 71) then Draws a purple line from (457, 203) to (361, 190) then Places a black 22x74 rectangle at position (36, 164).
; PLAN: r0=212(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=457(x1), r6=203(y1), r7=361(x2), r8=190(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=36(x), r11=164(y), r12=22(width), r13=74(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 203
LDI r7, 361
LDI r8, 190
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 164
LDI r12, 22
LDI r13, 74
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
