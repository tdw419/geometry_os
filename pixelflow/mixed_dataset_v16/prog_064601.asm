; DESCRIPTION: Composite: Places a green line segment connecting (362, 40) to (376, 199) then Renders a black box of size 113x14 starting at (223, 37) then Renders a blue disk with center (207, 152) and radius 67.
; PLAN: r0=362(x1), r1=40(y1), r2=376(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=37(y), r7=113(width), r8=14(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=152(y), r12=67(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 40
LDI r2, 376
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 37
LDI r7, 113
LDI r8, 14
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 152
LDI r12, 67
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
