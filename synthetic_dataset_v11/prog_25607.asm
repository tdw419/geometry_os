; DESCRIPTION: Composite: . Then Draws a orange circle centered at (161, 168) with radius 61. Then Renders a purple line between points (60, 164) and (200, 10).
; PLAN: r0=161(x), r1=168(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=60(x1), r1=164(y1), r2=200(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (161, 168) with radius 61.
; PLAN: r0=161(x), r1=168(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 168
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (60, 164) and (200, 10).
; PLAN: r0=60(x1), r1=164(y1), r2=200(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 164
LDI r2, 200
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
