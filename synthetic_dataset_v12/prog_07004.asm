; DESCRIPTION: Composite: Draws a orange line from (177, 66) to (218, 90) then Draws a black rectangle at (101, 223) with width 111 and height 27 then Draws a purple circle centered at (95, 80) with radius 36.
; PLAN: r0=177(x1), r1=66(y1), r2=218(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=223(y), r7=111(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x), r11=80(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 177
LDI r1, 66
LDI r2, 218
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 223
LDI r7, 111
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 80
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
