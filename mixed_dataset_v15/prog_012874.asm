; DESCRIPTION: Composite: Draws a blue circle centered at (365, 26) with radius 18 then Renders a red line between points (250, 101) and (308, 234) then Renders a purple box of size 31x113 starting at (56, 106).
; PLAN: r0=365(x), r1=26(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=101(y1), r7=308(x2), r8=234(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=106(y), r12=31(width), r13=113(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 26
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 101
LDI r7, 308
LDI r8, 234
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 106
LDI r12, 31
LDI r13, 113
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
