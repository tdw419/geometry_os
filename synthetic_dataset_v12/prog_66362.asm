; DESCRIPTION: Composite: Draws a magenta line from (436, 53) to (240, 239) then Sets a single yellow pixel at (0, 236) then Places a red circle of radius 30 at center (270, 148).
; PLAN: r0=436(x1), r1=53(y1), r2=240(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=236(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=270(x), r11=148(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 436
LDI r1, 53
LDI r2, 240
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 236
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 270
LDI r11, 148
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
