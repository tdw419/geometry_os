; DESCRIPTION: Draws a orange line from (151, 37) to (230, 94).
; PLAN: r0=151(x1), r1=37(y1), r2=230(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 37
LDI r2, 230
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
