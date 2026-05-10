; DESCRIPTION: Composite: Creates a black rectangular region at (115, 97) spanning 55 by 96 pixels then Renders a magenta disk with center (209, 149) and radius 27 then Draws a white line from (453, 30) to (265, 211).
; PLAN: r0=115(x), r1=97(y), r2=55(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=149(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x1), r11=30(y1), r12=265(x2), r13=211(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 97
LDI r2, 55
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 149
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 30
LDI r12, 265
LDI r13, 211
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
