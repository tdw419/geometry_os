; DESCRIPTION: Draws a purple line from (275, 127) to (19, 22).
; PLAN: r0=275(x1), r1=127(y1), r2=19(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 19
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
