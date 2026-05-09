; DESCRIPTION: Composite: Sets a single red pixel at (334, 240) then Draws a cyan line from (155, 155) to (444, 121) then Draws a purple circle centered at (255, 128) with radius 51.
; PLAN: r0=334(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=155(x1), r6=155(y1), r7=444(x2), r8=121(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=128(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 155
LDI r7, 444
LDI r8, 121
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 128
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
