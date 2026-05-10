; DESCRIPTION: Composite: Sets a single blue pixel at (133, 86) then Draws a blue rectangle at (8, 72) with width 78 and height 35 then Places a magenta line segment connecting (269, 54) to (351, 19).
; PLAN: r0=133(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=72(y), r7=78(width), r8=35(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x1), r11=54(y1), r12=351(x2), r13=19(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 86
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 72
LDI r7, 78
LDI r8, 35
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 54
LDI r12, 351
LDI r13, 19
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
