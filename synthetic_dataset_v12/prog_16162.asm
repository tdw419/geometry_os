; DESCRIPTION: Composite: Draws a magenta circle centered at (126, 148) with radius 51 then Sets a single yellow pixel at (272, 170) then Places a cyan line segment connecting (416, 41) to (26, 5).
; PLAN: r0=126(x), r1=148(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=170(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=416(x1), r11=41(y1), r12=26(x2), r13=5(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 148
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 170
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 416
LDI r11, 41
LDI r12, 26
LDI r13, 5
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
