; DESCRIPTION: Composite: Sets a single blue pixel at (225, 122) then Draws a green rectangle at (72, 125) with width 38 and height 106 then Places a blue line segment connecting (177, 151) to (460, 216).
; PLAN: r0=225(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=125(y), r7=38(width), r8=106(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x1), r11=151(y1), r12=460(x2), r13=216(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 122
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 125
LDI r7, 38
LDI r8, 106
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 151
LDI r12, 460
LDI r13, 216
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
