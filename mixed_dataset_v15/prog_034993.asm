; DESCRIPTION: Composite: Places a orange line segment connecting (127, 209) to (505, 107) then Draws a cyan circle centered at (230, 105) with radius 16 then Places a magenta 58x22 rectangle at position (235, 174).
; PLAN: r0=127(x1), r1=209(y1), r2=505(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=105(y), r7=16(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=174(y), r12=58(width), r13=22(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 209
LDI r2, 505
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 105
LDI r7, 16
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 174
LDI r12, 58
LDI r13, 22
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
