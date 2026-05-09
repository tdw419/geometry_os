; DESCRIPTION: Composite: Draws a white line from (82, 101) to (114, 40) then Sets a single orange pixel at (30, 152) then Renders a blue box of size 110x80 starting at (158, 118).
; PLAN: r0=82(x1), r1=101(y1), r2=114(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=152(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=118(y), r12=110(width), r13=80(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 101
LDI r2, 114
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 152
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 158
LDI r11, 118
LDI r12, 110
LDI r13, 80
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
