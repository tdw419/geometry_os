; DESCRIPTION: Draws a blue line from (444, 105) to (293, 26).
; PLAN: r0=444(x1), r1=105(y1), r2=293(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 105
LDI r2, 293
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
