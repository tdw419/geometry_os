; DESCRIPTION: Composite: Places a red dot at position (343, 34) then Draws a black line from (54, 223) to (382, 33) then Places a blue circle of radius 17 at center (475, 161).
; PLAN: r0=343(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=54(x1), r6=223(y1), r7=382(x2), r8=33(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=475(x), r11=161(y), r12=17(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 343
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 54
LDI r6, 223
LDI r7, 382
LDI r8, 33
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 161
LDI r12, 17
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
