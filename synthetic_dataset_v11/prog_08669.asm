; DESCRIPTION: Composite: . Then Draws a red circle centered at (66, 225) with radius 25. Then Renders a black line between points (248, 89) and (47, 171).
; PLAN: r0=66(x), r1=225(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x1), r1=89(y1), r2=47(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (66, 225) with radius 25.
; PLAN: r0=66(x), r1=225(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 225
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (248, 89) and (47, 171).
; PLAN: r0=248(x1), r1=89(y1), r2=47(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 89
LDI r2, 47
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
