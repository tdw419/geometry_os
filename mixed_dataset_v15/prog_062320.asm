; DESCRIPTION: Composite: Draws a white line from (125, 16) to (411, 80) then Renders a blue box of size 29x115 starting at (117, 27) then Renders a blue disk with center (335, 176) and radius 58.
; PLAN: r0=125(x1), r1=16(y1), r2=411(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=27(y), r7=29(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=176(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 16
LDI r2, 411
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 27
LDI r7, 29
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 176
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
