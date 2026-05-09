; DESCRIPTION: Draws a orange line from (305, 1) to (343, 206).
; PLAN: r0=305(x1), r1=1(y1), r2=343(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 1
LDI r2, 343
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
