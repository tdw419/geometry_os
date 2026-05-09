; DESCRIPTION: Composite: Draws a blue line from (4, 29) to (167, 244) then Sets a single blue pixel at (69, 34) then Places a yellow 32x99 rectangle at position (287, 36).
; PLAN: r0=4(x1), r1=29(y1), r2=167(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=34(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=36(y), r12=32(width), r13=99(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 29
LDI r2, 167
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 34
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 287
LDI r11, 36
LDI r12, 32
LDI r13, 99
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
