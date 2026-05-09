; DESCRIPTION: Draws a blue line from (203, 24) to (372, 77).
; PLAN: r0=203(x1), r1=24(y1), r2=372(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 24
LDI r2, 372
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
