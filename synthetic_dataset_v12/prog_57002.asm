; DESCRIPTION: Composite: Draws a purple circle centered at (220, 156) with radius 20 then Draws a purple rectangle at (83, 183) with width 42 and height 59 then Draws a green line from (11, 47) to (229, 216).
; PLAN: r0=220(x), r1=156(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=183(y), r7=42(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x1), r11=47(y1), r12=229(x2), r13=216(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 156
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 183
LDI r7, 42
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 47
LDI r12, 229
LDI r13, 216
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
