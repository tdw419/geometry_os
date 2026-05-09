; DESCRIPTION: Composite: Sets a single blue pixel at (24, 172) then Places a white line segment connecting (63, 207) to (218, 112) then Draws a black rectangle at (141, 77) with width 38 and height 102.
; PLAN: r0=24(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=207(y1), r7=218(x2), r8=112(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=77(y), r12=38(width), r13=102(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 207
LDI r7, 218
LDI r8, 112
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 77
LDI r12, 38
LDI r13, 102
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
