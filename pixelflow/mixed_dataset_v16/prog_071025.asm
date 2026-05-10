; DESCRIPTION: Composite: Sets a single black pixel at (325, 14) then Renders a red box of size 117x69 starting at (253, 9) then Places a orange line segment connecting (243, 191) to (106, 29).
; PLAN: r0=325(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=9(y), r7=117(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=243(x1), r11=191(y1), r12=106(x2), r13=29(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 14
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 253
LDI r6, 9
LDI r7, 117
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 191
LDI r12, 106
LDI r13, 29
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
