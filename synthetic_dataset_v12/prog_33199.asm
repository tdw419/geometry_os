; DESCRIPTION: Composite: Places a purple line segment connecting (460, 18) to (314, 47) then Places a yellow circle of radius 75 at center (303, 132) then Places a red dot at position (324, 249).
; PLAN: r0=460(x1), r1=18(y1), r2=314(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=132(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x), r11=249(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 18
LDI r2, 314
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 132
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 249
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
