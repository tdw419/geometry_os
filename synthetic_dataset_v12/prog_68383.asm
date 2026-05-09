; DESCRIPTION: Composite: Draws a cyan rectangle at (349, 5) with width 103 and height 34 then Places a magenta circle of radius 14 at center (472, 151) then Places a blue line segment connecting (285, 237) to (481, 159).
; PLAN: r0=349(x), r1=5(y), r2=103(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=151(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=285(x1), r11=237(y1), r12=481(x2), r13=159(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 5
LDI r2, 103
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 151
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 285
LDI r11, 237
LDI r12, 481
LDI r13, 159
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
