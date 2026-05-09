; DESCRIPTION: Draws a blue line from (191, 51) to (10, 107).
; PLAN: r0=191(x1), r1=51(y1), r2=10(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 51
LDI r2, 10
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
