; DESCRIPTION: Composite: Draws a white line from (114, 128) to (139, 199) then Renders a purple disk with center (315, 125) and radius 26 then Places a orange dot at position (388, 89).
; PLAN: r0=114(x1), r1=128(y1), r2=139(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=125(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=89(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 128
LDI r2, 139
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 125
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 89
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
