; DESCRIPTION: Composite: Draws a white line from (235, 94) to (407, 64) then Sets a single orange pixel at (90, 242) then Draws a black rectangle at (78, 234) with width 79 and height 18.
; PLAN: r0=235(x1), r1=94(y1), r2=407(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=234(y), r12=79(width), r13=18(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 94
LDI r2, 407
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 78
LDI r11, 234
LDI r12, 79
LDI r13, 18
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
