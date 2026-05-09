; DESCRIPTION: Places a orange line segment connecting (79, 19) to (349, 230).
; PLAN: r0=79(x1), r1=19(y1), r2=349(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 19
LDI r2, 349
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
