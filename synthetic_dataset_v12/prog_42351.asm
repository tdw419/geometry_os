; DESCRIPTION: Composite: Renders a yellow line between points (165, 124) and (501, 59) then Renders a purple disk with center (77, 207) and radius 28 then Sets a single black pixel at (375, 127).
; PLAN: r0=165(x1), r1=124(y1), r2=501(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=207(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=375(x), r11=127(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 124
LDI r2, 501
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 207
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 375
LDI r11, 127
LDI r12, 0x000000
PSET r10, r11, r12
HALT
