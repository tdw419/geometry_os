; DESCRIPTION: Composite: Places a purple line segment connecting (14, 206) to (177, 80) then Sets a single yellow pixel at (310, 222) then Draws a red rectangle at (157, 13) with width 98 and height 82.
; PLAN: r0=14(x1), r1=206(y1), r2=177(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=222(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=13(y), r12=98(width), r13=82(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 206
LDI r2, 177
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 222
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 157
LDI r11, 13
LDI r12, 98
LDI r13, 82
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
