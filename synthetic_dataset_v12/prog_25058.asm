; DESCRIPTION: Composite: Renders a black box of size 49x65 starting at (97, 146) then Draws a orange line from (235, 108) to (355, 170).
; PLAN: r0=97(x), r1=146(y), r2=49(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x1), r6=108(y1), r7=355(x2), r8=170(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 146
LDI r2, 49
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 108
LDI r7, 355
LDI r8, 170
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
