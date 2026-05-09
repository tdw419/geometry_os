; DESCRIPTION: Composite: Places a white circle of radius 56 at center (452, 76) then Draws a red line from (207, 154) to (277, 153) then Renders a white box of size 37x45 starting at (233, 203).
; PLAN: r0=452(x), r1=76(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=154(y1), r7=277(x2), r8=153(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=203(y), r12=37(width), r13=45(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 76
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 154
LDI r7, 277
LDI r8, 153
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 203
LDI r12, 37
LDI r13, 45
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
