; DESCRIPTION: Composite: Places a purple line segment connecting (389, 118) to (496, 15) then Creates a red rectangular region at (400, 130) spanning 95 by 54 pixels then Places a cyan dot at position (33, 216).
; PLAN: r0=389(x1), r1=118(y1), r2=496(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=130(y), r7=95(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=33(x), r11=216(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 118
LDI r2, 496
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 130
LDI r7, 95
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 216
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
