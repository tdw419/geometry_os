; DESCRIPTION: Composite: Draws a yellow line from (422, 166) to (250, 193) then Places a orange dot at position (134, 195) then Places a black circle of radius 80 at center (134, 166).
; PLAN: r0=422(x1), r1=166(y1), r2=250(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=195(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=166(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 166
LDI r2, 250
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 195
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 134
LDI r11, 166
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
