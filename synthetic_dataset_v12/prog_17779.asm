; DESCRIPTION: Composite: Draws a purple line from (380, 81) to (156, 40) then Sets a single green pixel at (329, 116) then Draws a white circle centered at (485, 128) with radius 25.
; PLAN: r0=380(x1), r1=81(y1), r2=156(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=116(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=485(x), r11=128(y), r12=25(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 81
LDI r2, 156
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 116
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 485
LDI r11, 128
LDI r12, 25
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
