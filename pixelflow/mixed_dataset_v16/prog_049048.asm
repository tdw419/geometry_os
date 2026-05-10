; DESCRIPTION: Composite: Draws a purple line from (332, 115) to (286, 45) then Draws a blue circle centered at (331, 63) with radius 52.
; PLAN: r0=332(x1), r1=115(y1), r2=286(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=63(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 332
LDI r1, 115
LDI r2, 286
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 63
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
