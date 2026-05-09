; DESCRIPTION: Composite: Places a blue dot at position (482, 43) then Places a orange 110x29 rectangle at position (349, 93) then Draws a red line from (211, 149) to (314, 251).
; PLAN: r0=482(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=93(y), r7=110(width), r8=29(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=211(x1), r11=149(y1), r12=314(x2), r13=251(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 482
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 349
LDI r6, 93
LDI r7, 110
LDI r8, 29
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 149
LDI r12, 314
LDI r13, 251
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
