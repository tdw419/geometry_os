; DESCRIPTION: Composite: Sets a single magenta pixel at (55, 116) then Places a orange line segment connecting (174, 117) to (426, 37) then Creates a purple rectangular region at (172, 5) spanning 45 by 18 pixels.
; PLAN: r0=55(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=174(x1), r6=117(y1), r7=426(x2), r8=37(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=5(y), r12=45(width), r13=18(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 117
LDI r7, 426
LDI r8, 37
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 5
LDI r12, 45
LDI r13, 18
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
