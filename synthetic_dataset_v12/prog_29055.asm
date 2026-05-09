; DESCRIPTION: Composite: Draws a black line from (18, 175) to (74, 248) then Places a magenta dot at position (236, 71) then Creates a blue rectangular region at (463, 96) spanning 36 by 45 pixels.
; PLAN: r0=18(x1), r1=175(y1), r2=74(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=463(x), r11=96(y), r12=36(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 175
LDI r2, 74
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 463
LDI r11, 96
LDI r12, 36
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
