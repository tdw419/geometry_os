; DESCRIPTION: Composite: Places a magenta circle of radius 30 at center (333, 225) then Sets a single orange pixel at (85, 28) then Draws a white line from (160, 49) to (417, 232).
; PLAN: r0=333(x), r1=225(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=28(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=160(x1), r11=49(y1), r12=417(x2), r13=232(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 225
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 28
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 160
LDI r11, 49
LDI r12, 417
LDI r13, 232
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
