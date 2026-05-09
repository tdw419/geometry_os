; DESCRIPTION: Composite: Places a yellow dot at position (355, 122) then Draws a blue line from (411, 240) to (169, 36) then Draws a orange rectangle at (12, 15) with width 33 and height 40.
; PLAN: r0=355(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=240(y1), r7=169(x2), r8=36(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=12(x), r11=15(y), r12=33(width), r13=40(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 411
LDI r6, 240
LDI r7, 169
LDI r8, 36
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 15
LDI r12, 33
LDI r13, 40
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
