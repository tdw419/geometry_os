; DESCRIPTION: Composite: Places a black dot at position (48, 110) then Draws a purple rectangle at (339, 111) with width 95 and height 37 then Draws a white line from (89, 133) to (84, 149).
; PLAN: r0=48(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=111(y), r7=95(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x1), r11=133(y1), r12=84(x2), r13=149(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 110
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 111
LDI r7, 95
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 133
LDI r12, 84
LDI r13, 149
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
