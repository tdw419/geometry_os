; DESCRIPTION: Composite: Draws a purple circle centered at (435, 81) with radius 62 then Draws a blue line from (17, 76) to (8, 114).
; PLAN: r0=435(x), r1=81(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=76(y1), r7=8(x2), r8=114(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 81
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 76
LDI r7, 8
LDI r8, 114
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
