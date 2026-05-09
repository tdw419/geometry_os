; DESCRIPTION: Composite: Creates a white rectangular region at (18, 109) spanning 40 by 78 pixels then Places a orange dot at position (170, 115) then Places a orange line segment connecting (148, 10) to (230, 68).
; PLAN: r0=18(x), r1=109(y), r2=40(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=148(x1), r11=10(y1), r12=230(x2), r13=68(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 109
LDI r2, 40
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 148
LDI r11, 10
LDI r12, 230
LDI r13, 68
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
