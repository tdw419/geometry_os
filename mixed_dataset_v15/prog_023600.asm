; DESCRIPTION: Composite: Draws a black circle centered at (356, 235) with radius 17 then Places a yellow line segment connecting (299, 121) to (78, 153) then Draws a blue rectangle at (216, 139) with width 102 and height 67.
; PLAN: r0=356(x), r1=235(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=121(y1), r7=78(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=139(y), r12=102(width), r13=67(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 235
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 121
LDI r7, 78
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 139
LDI r12, 102
LDI r13, 67
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
