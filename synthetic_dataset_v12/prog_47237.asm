; DESCRIPTION: Composite: Places a purple dot at position (118, 69) then Places a black line segment connecting (28, 98) to (285, 85) then Creates a red rectangular region at (435, 65) spanning 69 by 117 pixels.
; PLAN: r0=118(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=28(x1), r6=98(y1), r7=285(x2), r8=85(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=65(y), r12=69(width), r13=117(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 28
LDI r6, 98
LDI r7, 285
LDI r8, 85
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 65
LDI r12, 69
LDI r13, 117
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
