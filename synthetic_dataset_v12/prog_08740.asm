; DESCRIPTION: Composite: Places a magenta circle of radius 70 at center (204, 106) then Sets a single cyan pixel at (385, 239) then Renders a orange line between points (476, 250) and (405, 21).
; PLAN: r0=204(x), r1=106(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=239(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=476(x1), r11=250(y1), r12=405(x2), r13=21(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 106
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 239
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 476
LDI r11, 250
LDI r12, 405
LDI r13, 21
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
