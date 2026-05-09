; DESCRIPTION: Composite: Draws a magenta circle centered at (101, 181) with radius 73 then Draws a blue line from (465, 251) to (246, 221) then Places a purple 32x58 rectangle at position (354, 160).
; PLAN: r0=101(x), r1=181(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x1), r6=251(y1), r7=246(x2), r8=221(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=160(y), r12=32(width), r13=58(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 181
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 251
LDI r7, 246
LDI r8, 221
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 160
LDI r12, 32
LDI r13, 58
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
