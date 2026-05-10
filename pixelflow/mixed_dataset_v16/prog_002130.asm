; DESCRIPTION: Composite: Places a blue circle of radius 60 at center (377, 143) then Renders a blue line between points (493, 15) and (373, 185) then Creates a black rectangular region at (309, 106) spanning 32 by 15 pixels.
; PLAN: r0=377(x), r1=143(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x1), r6=15(y1), r7=373(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=309(x), r11=106(y), r12=32(width), r13=15(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 143
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 15
LDI r7, 373
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 106
LDI r12, 32
LDI r13, 15
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
