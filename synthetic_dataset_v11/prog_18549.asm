; DESCRIPTION: Composite: . Then Draws a red circle centered at (171, 94) with radius 78. Then Renders a magenta line between points (196, 148) and (251, 79).
; PLAN: r0=171(x), r1=94(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x1), r1=148(y1), r2=251(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (171, 94) with radius 78.
; PLAN: r0=171(x), r1=94(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 94
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (196, 148) and (251, 79).
; PLAN: r0=196(x1), r1=148(y1), r2=251(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 148
LDI r2, 251
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
