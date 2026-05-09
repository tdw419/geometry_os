; DESCRIPTION: Composite: . Then Places a orange circle of radius 36 at center (88, 164). Then Draws a blue line from (125, 218) to (182, 252).
; PLAN: r0=88(x), r1=164(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x1), r1=218(y1), r2=182(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 36 at center (88, 164).
; PLAN: r0=88(x), r1=164(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 164
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (125, 218) to (182, 252).
; PLAN: r0=125(x1), r1=218(y1), r2=182(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 218
LDI r2, 182
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
