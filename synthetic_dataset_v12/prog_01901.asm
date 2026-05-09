; DESCRIPTION: Composite: Draws a purple line from (5, 54) to (30, 20) then Places a white dot at position (229, 241) then Creates a black rectangular region at (385, 14) spanning 61 by 64 pixels.
; PLAN: r0=5(x1), r1=54(y1), r2=30(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=241(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=14(y), r12=61(width), r13=64(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 54
LDI r2, 30
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 241
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 14
LDI r12, 61
LDI r13, 64
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
