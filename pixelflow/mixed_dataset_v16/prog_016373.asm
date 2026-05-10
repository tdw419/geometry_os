; DESCRIPTION: Composite: Renders a purple box of size 43x61 starting at (237, 107) then Sets a single orange pixel at (189, 229) then Renders a blue line between points (313, 92) and (430, 71).
; PLAN: r0=237(x), r1=107(y), r2=43(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=229(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=313(x1), r11=92(y1), r12=430(x2), r13=71(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 107
LDI r2, 43
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 229
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 313
LDI r11, 92
LDI r12, 430
LDI r13, 71
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
