; DESCRIPTION: Composite: . Then Places a orange circle of radius 63 at center (155, 90). Then Draws a blue line from (98, 39) to (103, 218).
; PLAN: r0=155(x), r1=90(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=98(x1), r1=39(y1), r2=103(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 63 at center (155, 90).
; PLAN: r0=155(x), r1=90(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 90
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (98, 39) to (103, 218).
; PLAN: r0=98(x1), r1=39(y1), r2=103(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 39
LDI r2, 103
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
