; DESCRIPTION: Composite: Places a red dot at position (158, 186) then Renders a orange box of size 84x45 starting at (300, 69) then Renders a green line between points (97, 123) and (477, 223).
; PLAN: r0=158(x), r1=186(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=69(y), r7=84(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x1), r11=123(y1), r12=477(x2), r13=223(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 186
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 300
LDI r6, 69
LDI r7, 84
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 123
LDI r12, 477
LDI r13, 223
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
