; DESCRIPTION: Composite: Draws a red line from (322, 64) to (366, 87) then Places a red dot at position (511, 165) then Renders a green box of size 118x76 starting at (295, 83).
; PLAN: r0=322(x1), r1=64(y1), r2=366(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=165(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=83(y), r12=118(width), r13=76(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 64
LDI r2, 366
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 165
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 295
LDI r11, 83
LDI r12, 118
LDI r13, 76
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
