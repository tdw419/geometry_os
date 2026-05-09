; DESCRIPTION: Composite: Places a purple line segment connecting (295, 115) to (200, 210) then Sets a single black pixel at (505, 48) then Places a orange 35x85 rectangle at position (339, 88).
; PLAN: r0=295(x1), r1=115(y1), r2=200(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=505(x), r6=48(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=88(y), r12=35(width), r13=85(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 115
LDI r2, 200
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 48
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 339
LDI r11, 88
LDI r12, 35
LDI r13, 85
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
