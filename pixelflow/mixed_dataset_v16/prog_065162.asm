; DESCRIPTION: Composite: Creates a purple rectangular region at (216, 40) spanning 61 by 99 pixels then Sets a single black pixel at (263, 234) then Renders a black disk with center (112, 96) and radius 73.
; PLAN: r0=216(x), r1=40(y), r2=61(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=234(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=96(y), r12=73(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 40
LDI r2, 61
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 234
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 112
LDI r11, 96
LDI r12, 73
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
