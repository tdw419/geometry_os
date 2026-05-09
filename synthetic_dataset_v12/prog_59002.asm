; DESCRIPTION: Draws a blue line from (441, 124) to (288, 165).
; PLAN: r0=441(x1), r1=124(y1), r2=288(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 124
LDI r2, 288
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
