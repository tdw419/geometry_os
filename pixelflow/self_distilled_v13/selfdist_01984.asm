; DESCRIPTION: Draws a orange line from (249, 15) to (305, 23).
; PLAN: r0=249(x1), r1=15(y1), r2=305(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 15
LDI r2, 305
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
