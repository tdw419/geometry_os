; DESCRIPTION: Composite: Draws a black rectangle at (265, 81) with width 18 and height 94 then Places a magenta circle of radius 26 at center (53, 223) then Places a blue line segment connecting (71, 27) to (99, 235).
; PLAN: r0=265(x), r1=81(y), r2=18(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=223(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x1), r11=27(y1), r12=99(x2), r13=235(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 81
LDI r2, 18
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 223
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 27
LDI r12, 99
LDI r13, 235
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
