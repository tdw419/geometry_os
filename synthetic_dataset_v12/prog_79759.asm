; DESCRIPTION: Composite: Places a white line segment connecting (93, 61) to (451, 229) then Draws a black rectangle at (271, 99) with width 92 and height 19 then Places a red dot at position (247, 250).
; PLAN: r0=93(x1), r1=61(y1), r2=451(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=99(y), r7=92(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=247(x), r11=250(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 93
LDI r1, 61
LDI r2, 451
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 99
LDI r7, 92
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 250
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
