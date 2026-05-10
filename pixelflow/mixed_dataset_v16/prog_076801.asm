; DESCRIPTION: Composite: Renders a blue line between points (476, 195) and (474, 79) then Sets a single purple pixel at (50, 133) then Draws a white rectangle at (124, 65) with width 83 and height 38.
; PLAN: r0=476(x1), r1=195(y1), r2=474(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=133(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=124(x), r11=65(y), r12=83(width), r13=38(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 195
LDI r2, 474
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 133
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 124
LDI r11, 65
LDI r12, 83
LDI r13, 38
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
