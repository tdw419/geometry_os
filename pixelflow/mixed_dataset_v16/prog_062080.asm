; DESCRIPTION: Composite: Draws a yellow line from (466, 37) to (341, 123) then Sets a single yellow pixel at (179, 172) then Renders a white box of size 106x44 starting at (369, 26).
; PLAN: r0=466(x1), r1=37(y1), r2=341(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=26(y), r12=106(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 37
LDI r2, 341
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 369
LDI r11, 26
LDI r12, 106
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
