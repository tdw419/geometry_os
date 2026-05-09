; DESCRIPTION: Composite: Creates a blue circular shape at (387, 118) with radius 62 then Draws a black line from (216, 248) to (14, 220) then Places a orange dot at position (347, 50).
; PLAN: r0=387(x), r1=118(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x1), r6=248(y1), r7=14(x2), r8=220(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=50(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 118
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 248
LDI r7, 14
LDI r8, 220
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 50
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
