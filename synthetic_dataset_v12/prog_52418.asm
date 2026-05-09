; DESCRIPTION: Composite: Places a white line segment connecting (55, 77) to (434, 246) then Sets a single cyan pixel at (499, 61) then Places a purple 79x54 rectangle at position (17, 116).
; PLAN: r0=55(x1), r1=77(y1), r2=434(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=61(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=116(y), r12=79(width), r13=54(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 77
LDI r2, 434
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 61
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 17
LDI r11, 116
LDI r12, 79
LDI r13, 54
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
