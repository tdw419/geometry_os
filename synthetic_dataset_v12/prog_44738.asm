; DESCRIPTION: Draws a orange line from (460, 226) to (489, 14).
; PLAN: r0=460(x1), r1=226(y1), r2=489(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 226
LDI r2, 489
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
