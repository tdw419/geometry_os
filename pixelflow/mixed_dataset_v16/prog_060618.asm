; DESCRIPTION: Draws a purple line from (108, 234) to (293, 26).
; PLAN: r0=108(x1), r1=234(y1), r2=293(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 234
LDI r2, 293
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
