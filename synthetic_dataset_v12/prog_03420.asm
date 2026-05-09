; DESCRIPTION: Composite: Places a blue circle of radius 27 at center (28, 121) then Sets a single green pixel at (375, 33) then Draws a purple line from (216, 75) to (77, 216).
; PLAN: r0=28(x), r1=121(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=33(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=216(x1), r11=75(y1), r12=77(x2), r13=216(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 121
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 33
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 216
LDI r11, 75
LDI r12, 77
LDI r13, 216
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
