; DESCRIPTION: Composite: Draws a white rectangle at (289, 118) with width 15 and height 13 then Sets a single black pixel at (80, 59) then Places a black line segment connecting (306, 115) to (266, 120).
; PLAN: r0=289(x), r1=118(y), r2=15(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x), r6=59(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=306(x1), r11=115(y1), r12=266(x2), r13=120(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 289
LDI r1, 118
LDI r2, 15
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 59
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 306
LDI r11, 115
LDI r12, 266
LDI r13, 120
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
