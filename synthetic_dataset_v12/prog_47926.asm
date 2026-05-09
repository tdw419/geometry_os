; DESCRIPTION: Composite: Sets a single black pixel at (353, 230) then Draws a purple circle centered at (349, 176) with radius 35 then Draws a white line from (451, 163) to (178, 36).
; PLAN: r0=353(x), r1=230(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=176(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x1), r11=163(y1), r12=178(x2), r13=36(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 230
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 349
LDI r6, 176
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 163
LDI r12, 178
LDI r13, 36
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
