; DESCRIPTION: Composite: Creates a green rectangular region at (278, 138) spanning 87 by 108 pixels then Places a magenta circle of radius 43 at center (257, 193) then Renders a magenta line between points (174, 179) and (352, 153).
; PLAN: r0=278(x), r1=138(y), r2=87(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=193(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=174(x1), r11=179(y1), r12=352(x2), r13=153(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 138
LDI r2, 87
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 193
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 174
LDI r11, 179
LDI r12, 352
LDI r13, 153
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
