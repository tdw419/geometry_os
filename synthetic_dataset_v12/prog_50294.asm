; DESCRIPTION: Composite: Creates a orange rectangular region at (414, 30) spanning 72 by 12 pixels then Renders a orange disk with center (119, 207) and radius 36 then Draws a orange line from (423, 74) to (18, 42).
; PLAN: r0=414(x), r1=30(y), r2=72(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=207(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x1), r11=74(y1), r12=18(x2), r13=42(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 30
LDI r2, 72
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 207
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 74
LDI r12, 18
LDI r13, 42
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
