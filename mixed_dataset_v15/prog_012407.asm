; DESCRIPTION: Composite: Draws a black rectangle at (7, 108) with width 45 and height 72 then Draws a blue line from (15, 171) to (187, 181).
; PLAN: r0=7(x), r1=108(y), r2=45(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=171(y1), r7=187(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 108
LDI r2, 45
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 171
LDI r7, 187
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
