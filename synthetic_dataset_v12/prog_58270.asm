; DESCRIPTION: Composite: Creates a green rectangular region at (234, 194) spanning 44 by 17 pixels then Sets a single black pixel at (116, 208) then Renders a magenta disk with center (65, 172) and radius 65.
; PLAN: r0=234(x), r1=194(y), r2=44(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=65(x), r11=172(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 194
LDI r2, 44
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 65
LDI r11, 172
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
