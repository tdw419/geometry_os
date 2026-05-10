; DESCRIPTION: Composite: Draws a red rectangle at (247, 97) with width 37 and height 27 then Renders a blue line between points (247, 128) and (259, 51) then Creates a black circular shape at (362, 180) with radius 58.
; PLAN: r0=247(x), r1=97(y), r2=37(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x1), r6=128(y1), r7=259(x2), r8=51(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=180(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 97
LDI r2, 37
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 128
LDI r7, 259
LDI r8, 51
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 180
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
