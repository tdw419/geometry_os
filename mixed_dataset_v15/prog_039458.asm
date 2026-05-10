; DESCRIPTION: Composite: Places a black line segment connecting (107, 195) to (450, 144) then Places a yellow dot at position (54, 70) then Draws a magenta rectangle at (378, 67) with width 116 and height 45.
; PLAN: r0=107(x1), r1=195(y1), r2=450(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=67(y), r12=116(width), r13=45(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 195
LDI r2, 450
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 378
LDI r11, 67
LDI r12, 116
LDI r13, 45
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
