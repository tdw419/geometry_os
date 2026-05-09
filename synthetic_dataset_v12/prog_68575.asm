; DESCRIPTION: Composite: Draws a magenta line from (279, 45) to (436, 15) then Draws a blue rectangle at (336, 63) with width 67 and height 99 then Creates a black circular shape at (366, 69) with radius 66.
; PLAN: r0=279(x1), r1=45(y1), r2=436(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=63(y), r7=67(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=366(x), r11=69(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 279
LDI r1, 45
LDI r2, 436
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 63
LDI r7, 67
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 69
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
