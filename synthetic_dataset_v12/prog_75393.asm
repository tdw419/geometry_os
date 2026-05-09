; DESCRIPTION: Composite: Draws a red line from (319, 35) to (141, 87) then Places a orange circle of radius 13 at center (122, 218) then Places a magenta dot at position (275, 6).
; PLAN: r0=319(x1), r1=35(y1), r2=141(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=218(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=275(x), r11=6(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 319
LDI r1, 35
LDI r2, 141
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 218
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 275
LDI r11, 6
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
