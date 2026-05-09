; DESCRIPTION: Composite: Renders a black box of size 22x92 starting at (356, 29) then Draws a red line from (117, 212) to (91, 22) then Sets a single white pixel at (324, 87).
; PLAN: r0=356(x), r1=29(y), r2=22(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=212(y1), r7=91(x2), r8=22(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=324(x), r11=87(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 29
LDI r2, 22
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 212
LDI r7, 91
LDI r8, 22
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 87
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
