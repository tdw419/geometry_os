; DESCRIPTION: Composite: Places a yellow line segment connecting (370, 86) to (367, 17) then Places a purple dot at position (470, 166) then Places a black circle of radius 57 at center (429, 167).
; PLAN: r0=370(x1), r1=86(y1), r2=367(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=166(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=429(x), r11=167(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 86
LDI r2, 367
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 166
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 429
LDI r11, 167
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
