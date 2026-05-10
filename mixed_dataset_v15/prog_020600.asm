; DESCRIPTION: Composite: Draws a white line from (257, 119) to (126, 125) then Renders a blue box of size 33x114 starting at (336, 63) then Places a magenta circle of radius 76 at center (434, 116).
; PLAN: r0=257(x1), r1=119(y1), r2=126(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=63(y), r7=33(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x), r11=116(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 119
LDI r2, 126
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 63
LDI r7, 33
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 116
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
