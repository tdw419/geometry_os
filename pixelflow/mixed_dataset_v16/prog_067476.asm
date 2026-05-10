; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (367, 69) then Places a black line segment connecting (212, 155) to (498, 217).
; PLAN: r0=367(x), r1=69(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x1), r6=155(y1), r7=498(x2), r8=217(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 69
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 155
LDI r7, 498
LDI r8, 217
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
