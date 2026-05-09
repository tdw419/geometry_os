; DESCRIPTION: Composite: . Then Renders a black line between points (44, 186) and (173, 170). Then Draws a green circle centered at (13, 134) with radius 13.
; PLAN: r0=44(x1), r1=186(y1), r2=173(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=134(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (44, 186) and (173, 170).
; PLAN: r0=44(x1), r1=186(y1), r2=173(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 186
LDI r2, 173
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (13, 134) with radius 13.
; PLAN: r0=13(x), r1=134(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 13
LDI r1, 134
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
