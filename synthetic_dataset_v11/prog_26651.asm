; DESCRIPTION: Composite: . Then Renders a red disk with center (89, 87) and radius 58. Then Draws a red line from (248, 88) to (56, 24).
; PLAN: r0=89(x), r1=87(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=248(x1), r1=88(y1), r2=56(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (89, 87) and radius 58.
; PLAN: r0=89(x), r1=87(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 87
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (248, 88) to (56, 24).
; PLAN: r0=248(x1), r1=88(y1), r2=56(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 88
LDI r2, 56
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
