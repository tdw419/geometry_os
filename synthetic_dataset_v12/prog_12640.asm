; DESCRIPTION: Composite: Draws a red line from (149, 182) to (205, 23) then Places a purple dot at position (134, 252) then Renders a black box of size 55x102 starting at (38, 108).
; PLAN: r0=149(x1), r1=182(y1), r2=205(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=252(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=108(y), r12=55(width), r13=102(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 182
LDI r2, 205
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 252
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 38
LDI r11, 108
LDI r12, 55
LDI r13, 102
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
