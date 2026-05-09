; DESCRIPTION: Composite: Places a red dot at position (59, 89) then Places a purple line segment connecting (301, 22) to (212, 238) then Renders a black box of size 52x102 starting at (231, 83).
; PLAN: r0=59(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=301(x1), r6=22(y1), r7=212(x2), r8=238(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=83(y), r12=52(width), r13=102(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 301
LDI r6, 22
LDI r7, 212
LDI r8, 238
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 83
LDI r12, 52
LDI r13, 102
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
