; DESCRIPTION: Composite: Places a black circle of radius 28 at center (336, 172) then Draws a purple line from (38, 17) to (88, 52).
; PLAN: r0=336(x), r1=172(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=17(y1), r7=88(x2), r8=52(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 172
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 17
LDI r7, 88
LDI r8, 52
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
