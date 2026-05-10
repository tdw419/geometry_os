; DESCRIPTION: Composite: Places a white 80x18 rectangle at position (362, 230) then Draws a yellow line from (15, 207) to (492, 45) then Renders a blue disk with center (280, 158) and radius 69.
; PLAN: r0=362(x), r1=230(y), r2=80(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=207(y1), r7=492(x2), r8=45(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=158(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 230
LDI r2, 80
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 207
LDI r7, 492
LDI r8, 45
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 158
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
