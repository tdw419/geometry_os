; DESCRIPTION: Composite: Places a green line segment connecting (168, 230) to (368, 200) then Draws a black rectangle at (17, 218) with width 107 and height 33 then Creates a magenta circular shape at (419, 147) with radius 64.
; PLAN: r0=168(x1), r1=230(y1), r2=368(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=218(y), r7=107(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x), r11=147(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 168
LDI r1, 230
LDI r2, 368
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 218
LDI r7, 107
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 147
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
