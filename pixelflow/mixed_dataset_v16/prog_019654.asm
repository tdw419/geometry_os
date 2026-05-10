; DESCRIPTION: Composite: Creates a black rectangular region at (39, 194) spanning 38 by 54 pixels then Sets a single white pixel at (143, 199) then Renders a blue line between points (18, 107) and (9, 35).
; PLAN: r0=39(x), r1=194(y), r2=38(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=199(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=18(x1), r11=107(y1), r12=9(x2), r13=35(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 194
LDI r2, 38
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 199
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 18
LDI r11, 107
LDI r12, 9
LDI r13, 35
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
