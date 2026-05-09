; DESCRIPTION: Composite: Creates a red rectangular region at (134, 85) spanning 95 by 21 pixels then Sets a single black pixel at (485, 238) then Draws a purple line from (402, 47) to (171, 227).
; PLAN: r0=134(x), r1=85(y), r2=95(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=485(x), r6=238(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=47(y1), r12=171(x2), r13=227(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 85
LDI r2, 95
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 238
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 402
LDI r11, 47
LDI r12, 171
LDI r13, 227
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
