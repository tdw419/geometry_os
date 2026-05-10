; DESCRIPTION: Composite: Renders a black line between points (54, 157) and (239, 217) then Places a blue dot at position (219, 130) then Creates a magenta rectangular region at (194, 119) spanning 68 by 113 pixels.
; PLAN: r0=54(x1), r1=157(y1), r2=239(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=130(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=119(y), r12=68(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 54
LDI r1, 157
LDI r2, 239
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 130
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 119
LDI r12, 68
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
