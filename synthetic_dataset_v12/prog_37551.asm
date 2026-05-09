; DESCRIPTION: Composite: Draws a white line from (285, 18) to (368, 121) then Draws a blue circle centered at (258, 108) with radius 35 then Sets a single orange pixel at (177, 220).
; PLAN: r0=285(x1), r1=18(y1), r2=368(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=108(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=177(x), r11=220(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 18
LDI r2, 368
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 108
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 177
LDI r11, 220
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
