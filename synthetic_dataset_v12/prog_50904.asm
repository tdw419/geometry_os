; DESCRIPTION: Composite: Draws a purple line from (333, 103) to (348, 135) then Places a cyan dot at position (163, 23) then Draws a yellow circle centered at (338, 105) with radius 78.
; PLAN: r0=333(x1), r1=103(y1), r2=348(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=105(y), r12=78(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 103
LDI r2, 348
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 338
LDI r11, 105
LDI r12, 78
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
