; DESCRIPTION: Composite: Sets a single blue pixel at (468, 214) then Draws a blue rectangle at (155, 59) with width 25 and height 96 then Places a green line segment connecting (130, 235) to (359, 152).
; PLAN: r0=468(x), r1=214(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=59(y), r7=25(width), r8=96(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x1), r11=235(y1), r12=359(x2), r13=152(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 214
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 155
LDI r6, 59
LDI r7, 25
LDI r8, 96
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 235
LDI r12, 359
LDI r13, 152
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
