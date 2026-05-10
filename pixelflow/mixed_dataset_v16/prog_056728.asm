; DESCRIPTION: Composite: Places a red dot at position (114, 80) then Creates a black rectangular region at (102, 45) spanning 103 by 41 pixels then Places a orange line segment connecting (337, 220) to (444, 87).
; PLAN: r0=114(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=45(y), r7=103(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x1), r11=220(y1), r12=444(x2), r13=87(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 102
LDI r6, 45
LDI r7, 103
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 220
LDI r12, 444
LDI r13, 87
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
