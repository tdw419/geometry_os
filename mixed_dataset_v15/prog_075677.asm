; DESCRIPTION: Composite: Draws a green line from (254, 185) to (462, 212) then Places a yellow circle of radius 10 at center (235, 222) then Draws a magenta rectangle at (403, 47) with width 94 and height 97.
; PLAN: r0=254(x1), r1=185(y1), r2=462(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=222(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x), r11=47(y), r12=94(width), r13=97(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 185
LDI r2, 462
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 222
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 47
LDI r12, 94
LDI r13, 97
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
