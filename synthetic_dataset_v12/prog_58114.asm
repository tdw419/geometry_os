; DESCRIPTION: Composite: Creates a white rectangular region at (407, 4) spanning 35 by 51 pixels then Places a blue line segment connecting (313, 155) to (215, 229) then Places a purple dot at position (256, 29).
; PLAN: r0=407(x), r1=4(y), r2=35(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=155(y1), r7=215(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=29(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 4
LDI r2, 35
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 155
LDI r7, 215
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 29
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
