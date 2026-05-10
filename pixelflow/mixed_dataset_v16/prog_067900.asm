; DESCRIPTION: Composite: Places a blue circle of radius 27 at center (484, 109) then Draws a red rectangle at (69, 144) with width 48 and height 93 then Draws a black line from (313, 224) to (228, 251).
; PLAN: r0=484(x), r1=109(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=144(y), r7=48(width), r8=93(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x1), r11=224(y1), r12=228(x2), r13=251(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 109
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 144
LDI r7, 48
LDI r8, 93
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 224
LDI r12, 228
LDI r13, 251
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
