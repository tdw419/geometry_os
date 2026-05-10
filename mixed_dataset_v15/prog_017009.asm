; DESCRIPTION: Composite: Renders a orange box of size 52x79 starting at (214, 14) then Places a white dot at position (158, 181) then Places a blue line segment connecting (352, 98) to (288, 49).
; PLAN: r0=214(x), r1=14(y), r2=52(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=181(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=352(x1), r11=98(y1), r12=288(x2), r13=49(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 14
LDI r2, 52
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 181
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 352
LDI r11, 98
LDI r12, 288
LDI r13, 49
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
