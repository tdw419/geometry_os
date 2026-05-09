; DESCRIPTION: Composite: Creates a yellow rectangular region at (37, 73) spanning 36 by 14 pixels then Draws a blue line from (174, 143) to (374, 219) then Sets a single magenta pixel at (342, 100).
; PLAN: r0=37(x), r1=73(y), r2=36(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x1), r6=143(y1), r7=374(x2), r8=219(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=100(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 73
LDI r2, 36
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 143
LDI r7, 374
LDI r8, 219
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 100
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
