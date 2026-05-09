; DESCRIPTION: Composite: Draws a blue circle centered at (225, 167) with radius 49 then Renders a red box of size 89x101 starting at (291, 112) then Draws a green line from (209, 184) to (282, 238).
; PLAN: r0=225(x), r1=167(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=112(y), r7=89(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x1), r11=184(y1), r12=282(x2), r13=238(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 167
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 112
LDI r7, 89
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 184
LDI r12, 282
LDI r13, 238
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
