; DESCRIPTION: Composite: Renders a purple line between points (78, 41) and (102, 132) then Sets a single purple pixel at (223, 58) then Creates a cyan rectangular region at (210, 114) spanning 21 by 108 pixels.
; PLAN: r0=78(x1), r1=41(y1), r2=102(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=58(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=114(y), r12=21(width), r13=108(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 41
LDI r2, 102
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 58
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 210
LDI r11, 114
LDI r12, 21
LDI r13, 108
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
