; DESCRIPTION: Composite: Draws a blue circle centered at (362, 98) with radius 51 then Places a white line segment connecting (207, 44) to (501, 142) then Draws a magenta rectangle at (90, 59) with width 114 and height 54.
; PLAN: r0=362(x), r1=98(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=44(y1), r7=501(x2), r8=142(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=59(y), r12=114(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 98
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 44
LDI r7, 501
LDI r8, 142
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 59
LDI r12, 114
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
