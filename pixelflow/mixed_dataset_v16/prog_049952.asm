; DESCRIPTION: Draws a orange line from (305, 97) to (345, 175).
; PLAN: r0=305(x1), r1=97(y1), r2=345(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 97
LDI r2, 345
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
