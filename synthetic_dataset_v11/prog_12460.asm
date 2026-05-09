; DESCRIPTION: Composite: . Then Draws a orange circle centered at (133, 220) with radius 16. Then Draws a orange line from (232, 240) to (120, 64).
; PLAN: r0=133(x), r1=220(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=232(x1), r1=240(y1), r2=120(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (133, 220) with radius 16.
; PLAN: r0=133(x), r1=220(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 220
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (232, 240) to (120, 64).
; PLAN: r0=232(x1), r1=240(y1), r2=120(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 240
LDI r2, 120
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
