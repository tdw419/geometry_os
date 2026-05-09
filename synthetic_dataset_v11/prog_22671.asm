; DESCRIPTION: Draws a blue line from (132, 45) to (214, 77).
; PLAN: r0=132(x1), r1=45(y1), r2=214(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 45
LDI r2, 214
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
