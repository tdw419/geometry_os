; DESCRIPTION: Renders a orange line between points (349, 75) and (387, 197).
; PLAN: r0=349(x1), r1=75(y1), r2=387(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 75
LDI r2, 387
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
