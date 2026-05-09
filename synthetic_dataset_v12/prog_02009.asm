; DESCRIPTION: Composite: Renders a orange disk with center (455, 195) and radius 57 then Places a purple dot at position (37, 181) then Draws a red line from (338, 119) to (466, 114).
; PLAN: r0=455(x), r1=195(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=181(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=338(x1), r11=119(y1), r12=466(x2), r13=114(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 195
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 181
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 338
LDI r11, 119
LDI r12, 466
LDI r13, 114
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
