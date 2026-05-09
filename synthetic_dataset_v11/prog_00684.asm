; DESCRIPTION: Composite: . Then Draws a orange circle centered at (155, 120) with radius 50. Then Renders a black line between points (221, 90) and (157, 131).
; PLAN: r0=155(x), r1=120(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=221(x1), r1=90(y1), r2=157(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (155, 120) with radius 50.
; PLAN: r0=155(x), r1=120(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 120
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (221, 90) and (157, 131).
; PLAN: r0=221(x1), r1=90(y1), r2=157(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 90
LDI r2, 157
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
