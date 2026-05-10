; DESCRIPTION: Composite: Places a yellow dot at position (6, 230) then Renders a red line between points (476, 70) and (16, 255) then Renders a orange box of size 65x118 starting at (383, 35).
; PLAN: r0=6(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=70(y1), r7=16(x2), r8=255(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=35(y), r12=65(width), r13=118(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 476
LDI r6, 70
LDI r7, 16
LDI r8, 255
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 35
LDI r12, 65
LDI r13, 118
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
