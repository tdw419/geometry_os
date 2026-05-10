; DESCRIPTION: Composite: Creates a blue rectangular region at (146, 185) spanning 38 by 25 pixels then Places a white dot at position (142, 15) then Places a white line segment connecting (203, 61) to (62, 28).
; PLAN: r0=146(x), r1=185(y), r2=38(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x), r6=15(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=203(x1), r11=61(y1), r12=62(x2), r13=28(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 185
LDI r2, 38
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 15
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 61
LDI r12, 62
LDI r13, 28
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
