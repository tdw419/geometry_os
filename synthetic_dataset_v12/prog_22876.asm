; DESCRIPTION: Composite: Draws a blue line from (435, 41) to (314, 126) then Places a purple circle of radius 21 at center (175, 31).
; PLAN: r0=435(x1), r1=41(y1), r2=314(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=31(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 41
LDI r2, 314
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 31
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
