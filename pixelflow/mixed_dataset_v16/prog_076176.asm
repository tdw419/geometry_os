; DESCRIPTION: Composite: Renders a black disk with center (447, 83) and radius 18 then Places a magenta dot at position (333, 245) then Draws a orange line from (348, 24) to (310, 110).
; PLAN: r0=447(x), r1=83(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=245(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=348(x1), r11=24(y1), r12=310(x2), r13=110(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 83
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 245
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 24
LDI r12, 310
LDI r13, 110
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
