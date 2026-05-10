; DESCRIPTION: Composite: Draws a red line from (355, 3) to (404, 237) then Sets a single white pixel at (81, 62) then Places a black circle of radius 79 at center (421, 150).
; PLAN: r0=355(x1), r1=3(y1), r2=404(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=62(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=150(y), r12=79(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 3
LDI r2, 404
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 62
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 421
LDI r11, 150
LDI r12, 79
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
