; DESCRIPTION: Draws a orange line from (57, 30) to (367, 238).
; PLAN: r0=57(x1), r1=30(y1), r2=367(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 367
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
