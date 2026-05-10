; DESCRIPTION: Draws a blue line from (223, 178) to (293, 114).
; PLAN: r0=223(x1), r1=178(y1), r2=293(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 178
LDI r2, 293
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
