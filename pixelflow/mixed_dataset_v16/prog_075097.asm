; DESCRIPTION: Composite: Creates a cyan rectangular region at (120, 149) spanning 120 by 89 pixels then Draws a orange circle centered at (122, 185) with radius 63 then Renders a blue line between points (378, 151) and (187, 253).
; PLAN: r0=120(x), r1=149(y), r2=120(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=185(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x1), r11=151(y1), r12=187(x2), r13=253(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 149
LDI r2, 120
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 185
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 151
LDI r12, 187
LDI r13, 253
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
