; DESCRIPTION: Draws a blue line from (283, 178) to (293, 149).
; PLAN: r0=283(x1), r1=178(y1), r2=293(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 178
LDI r2, 293
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
