; DESCRIPTION: Draws a purple line from (293, 138) to (313, 19).
; PLAN: r0=293(x1), r1=138(y1), r2=313(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 138
LDI r2, 313
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
