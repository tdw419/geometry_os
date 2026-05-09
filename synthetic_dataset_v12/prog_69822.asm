; DESCRIPTION: Composite: Creates a orange rectangular region at (302, 135) spanning 10 by 108 pixels then Places a red dot at position (117, 156) then Renders a blue line between points (306, 150) and (235, 9).
; PLAN: r0=302(x), r1=135(y), r2=10(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x), r6=156(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=306(x1), r11=150(y1), r12=235(x2), r13=9(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 135
LDI r2, 10
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 156
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 306
LDI r11, 150
LDI r12, 235
LDI r13, 9
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
