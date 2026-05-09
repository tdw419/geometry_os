; DESCRIPTION: Composite: Places a black 102x34 rectangle at position (45, 142) then Draws a blue line from (248, 17) to (11, 112) then Draws a magenta circle centered at (219, 212) with radius 32.
; PLAN: r0=45(x), r1=142(y), r2=102(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x1), r6=17(y1), r7=11(x2), r8=112(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=212(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 142
LDI r2, 102
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 17
LDI r7, 11
LDI r8, 112
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 212
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
