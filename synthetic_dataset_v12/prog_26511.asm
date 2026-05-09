; DESCRIPTION: Composite: Renders a black line between points (462, 114) and (347, 70) then Places a red dot at position (299, 247) then Places a blue 77x79 rectangle at position (402, 127).
; PLAN: r0=462(x1), r1=114(y1), r2=347(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=247(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=402(x), r11=127(y), r12=77(width), r13=79(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 114
LDI r2, 347
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 247
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 402
LDI r11, 127
LDI r12, 77
LDI r13, 79
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
