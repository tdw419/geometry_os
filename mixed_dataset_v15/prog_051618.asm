; DESCRIPTION: Composite: Renders a purple line between points (249, 42) and (451, 17) then Draws a yellow circle centered at (445, 178) with radius 51.
; PLAN: r0=249(x1), r1=42(y1), r2=451(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=178(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 42
LDI r2, 451
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 178
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
