; DESCRIPTION: Composite: Creates a blue rectangular region at (303, 11) spanning 48 by 66 pixels then Places a purple dot at position (267, 35) then Places a orange line segment connecting (328, 72) to (455, 40).
; PLAN: r0=303(x), r1=11(y), r2=48(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=35(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=328(x1), r11=72(y1), r12=455(x2), r13=40(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 11
LDI r2, 48
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 35
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 328
LDI r11, 72
LDI r12, 455
LDI r13, 40
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
