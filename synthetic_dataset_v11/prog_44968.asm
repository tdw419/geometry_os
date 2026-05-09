; DESCRIPTION: Composite: . Then Renders a orange line between points (142, 77) and (157, 155). Then Draws a black circle centered at (118, 62) with radius 60.
; PLAN: r0=142(x1), r1=77(y1), r2=157(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=62(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (142, 77) and (157, 155).
; PLAN: r0=142(x1), r1=77(y1), r2=157(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 77
LDI r2, 157
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (118, 62) with radius 60.
; PLAN: r0=118(x), r1=62(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 62
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
