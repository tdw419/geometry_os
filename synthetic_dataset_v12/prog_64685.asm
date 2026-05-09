; DESCRIPTION: Composite: Creates a red rectangular region at (385, 149) spanning 29 by 71 pixels then Places a black circle of radius 58 at center (98, 117) then Places a black line segment connecting (313, 48) to (323, 51).
; PLAN: r0=385(x), r1=149(y), r2=29(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=117(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x1), r11=48(y1), r12=323(x2), r13=51(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 149
LDI r2, 29
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 117
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 48
LDI r12, 323
LDI r13, 51
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
