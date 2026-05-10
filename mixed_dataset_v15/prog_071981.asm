; DESCRIPTION: Composite: Draws a black line from (378, 52) to (234, 4) then Places a blue circle of radius 39 at center (148, 52).
; PLAN: r0=378(x1), r1=52(y1), r2=234(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=52(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 52
LDI r2, 234
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 52
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
