; DESCRIPTION: Draws a orange line from (221, 90) to (107, 226).
; PLAN: r0=221(x1), r1=90(y1), r2=107(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 90
LDI r2, 107
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
