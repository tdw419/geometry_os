; DESCRIPTION: Composite: Draws a white line from (496, 94) to (455, 212) then Places a cyan dot at position (442, 96) then Renders a purple disk with center (286, 137) and radius 44.
; PLAN: r0=496(x1), r1=94(y1), r2=455(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=96(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=137(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 496
LDI r1, 94
LDI r2, 455
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 96
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 286
LDI r11, 137
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
