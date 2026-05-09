; DESCRIPTION: Composite: Places a magenta line segment connecting (492, 3) to (257, 80) then Sets a single purple pixel at (336, 133) then Renders a orange box of size 113x29 starting at (54, 124).
; PLAN: r0=492(x1), r1=3(y1), r2=257(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=133(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=124(y), r12=113(width), r13=29(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 3
LDI r2, 257
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 133
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 54
LDI r11, 124
LDI r12, 113
LDI r13, 29
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
