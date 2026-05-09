; DESCRIPTION: Draws a orange line from (57, 226) to (25, 14).
; PLAN: r0=57(x1), r1=226(y1), r2=25(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 226
LDI r2, 25
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
