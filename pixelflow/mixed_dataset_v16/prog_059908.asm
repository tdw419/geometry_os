; DESCRIPTION: Composite: Draws a black rectangle at (199, 136) with width 16 and height 23 then Places a yellow line segment connecting (142, 234) to (73, 7) then Sets a single magenta pixel at (151, 155).
; PLAN: r0=199(x), r1=136(y), r2=16(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x1), r6=234(y1), r7=73(x2), r8=7(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=155(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 136
LDI r2, 16
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 234
LDI r7, 73
LDI r8, 7
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 155
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
