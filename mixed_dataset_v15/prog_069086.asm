; DESCRIPTION: Composite: Draws a green line from (136, 71) to (326, 217) then Places a yellow circle of radius 29 at center (343, 77).
; PLAN: r0=136(x1), r1=71(y1), r2=326(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=77(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 71
LDI r2, 326
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 77
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
