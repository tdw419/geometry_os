; DESCRIPTION: Composite: Places a yellow line segment connecting (481, 123) to (417, 103) then Places a purple dot at position (290, 102) then Creates a green rectangular region at (96, 66) spanning 98 by 94 pixels.
; PLAN: r0=481(x1), r1=123(y1), r2=417(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=66(y), r12=98(width), r13=94(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 123
LDI r2, 417
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 66
LDI r12, 98
LDI r13, 94
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
