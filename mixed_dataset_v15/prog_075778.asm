; DESCRIPTION: Composite: Sets a single yellow pixel at (108, 85) then Draws a black line from (284, 77) to (281, 222) then Draws a magenta rectangle at (145, 203) with width 116 and height 35.
; PLAN: r0=108(x), r1=85(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=77(y1), r7=281(x2), r8=222(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=203(y), r12=116(width), r13=35(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 85
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 77
LDI r7, 281
LDI r8, 222
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 203
LDI r12, 116
LDI r13, 35
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
