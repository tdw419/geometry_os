; DESCRIPTION: Composite: Draws a red line from (356, 191) to (250, 40) then Renders a white disk with center (82, 111) and radius 48 then Draws a white rectangle at (207, 158) with width 118 and height 13.
; PLAN: r0=356(x1), r1=191(y1), r2=250(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=111(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=207(x), r11=158(y), r12=118(width), r13=13(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 191
LDI r2, 250
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 111
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 207
LDI r11, 158
LDI r12, 118
LDI r13, 13
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
