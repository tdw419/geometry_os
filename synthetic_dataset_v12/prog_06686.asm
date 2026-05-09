; DESCRIPTION: Composite: Draws a purple rectangle at (89, 199) with width 92 and height 22 then Sets a single green pixel at (14, 61) then Renders a blue line between points (181, 35) and (380, 197).
; PLAN: r0=89(x), r1=199(y), r2=92(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=35(y1), r12=380(x2), r13=197(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 199
LDI r2, 92
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 181
LDI r11, 35
LDI r12, 380
LDI r13, 197
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
