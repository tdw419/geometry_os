; DESCRIPTION: Composite: Renders a blue disk with center (389, 122) and radius 53 then Draws a purple line from (268, 88) to (438, 164).
; PLAN: r0=389(x), r1=122(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x1), r6=88(y1), r7=438(x2), r8=164(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 122
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 88
LDI r7, 438
LDI r8, 164
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
