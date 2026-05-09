; DESCRIPTION: Composite: Draws a orange line from (375, 197) to (269, 102) then Places a red dot at position (221, 61) then Creates a magenta circular shape at (135, 137) with radius 65.
; PLAN: r0=375(x1), r1=197(y1), r2=269(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=61(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=137(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 197
LDI r2, 269
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 61
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 135
LDI r11, 137
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
