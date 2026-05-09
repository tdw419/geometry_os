; DESCRIPTION: Draws a orange line from (312, 226) to (305, 194).
; PLAN: r0=312(x1), r1=226(y1), r2=305(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 226
LDI r2, 305
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
