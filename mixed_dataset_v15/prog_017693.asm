; DESCRIPTION: Composite: Draws a purple line from (498, 102) to (20, 81) then Sets a single white pixel at (128, 245) then Renders a orange box of size 43x40 starting at (398, 2).
; PLAN: r0=498(x1), r1=102(y1), r2=20(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=245(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=398(x), r11=2(y), r12=43(width), r13=40(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 102
LDI r2, 20
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 245
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 398
LDI r11, 2
LDI r12, 43
LDI r13, 40
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
