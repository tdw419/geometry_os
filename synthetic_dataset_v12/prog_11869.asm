; DESCRIPTION: Composite: Renders a orange box of size 84x71 starting at (158, 172) then Sets a single blue pixel at (343, 181) then Places a blue line segment connecting (506, 249) to (460, 215).
; PLAN: r0=158(x), r1=172(y), r2=84(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=181(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=506(x1), r11=249(y1), r12=460(x2), r13=215(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 172
LDI r2, 84
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 181
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 506
LDI r11, 249
LDI r12, 460
LDI r13, 215
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
