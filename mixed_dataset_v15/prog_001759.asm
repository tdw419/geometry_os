; DESCRIPTION: Composite: Draws a orange line from (276, 43) to (330, 2) then Places a black dot at position (215, 92) then Renders a blue box of size 87x72 starting at (399, 75).
; PLAN: r0=276(x1), r1=43(y1), r2=330(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=92(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=399(x), r11=75(y), r12=87(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 43
LDI r2, 330
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 92
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 399
LDI r11, 75
LDI r12, 87
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
