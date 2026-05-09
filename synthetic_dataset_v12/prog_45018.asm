; DESCRIPTION: Composite: Draws a white line from (161, 151) to (452, 95) then Creates a black rectangular region at (438, 13) spanning 26 by 11 pixels.
; PLAN: r0=161(x1), r1=151(y1), r2=452(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=13(y), r7=26(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 151
LDI r2, 452
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 13
LDI r7, 26
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
