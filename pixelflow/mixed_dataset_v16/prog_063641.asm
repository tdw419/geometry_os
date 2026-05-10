; DESCRIPTION: Composite: Places a blue line segment connecting (250, 114) to (194, 93) then Sets a single blue pixel at (375, 81) then Renders a green box of size 98x12 starting at (67, 17).
; PLAN: r0=250(x1), r1=114(y1), r2=194(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=81(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=67(x), r11=17(y), r12=98(width), r13=12(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 114
LDI r2, 194
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 81
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 67
LDI r11, 17
LDI r12, 98
LDI r13, 12
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
