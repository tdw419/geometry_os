; DESCRIPTION: Renders a orange line between points (120, 197) and (261, 58).
; PLAN: r0=120(x1), r1=197(y1), r2=261(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 197
LDI r2, 261
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
