; DESCRIPTION: Draws a blue line from (55, 137) to (11, 107).
; PLAN: r0=55(x1), r1=137(y1), r2=11(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 137
LDI r2, 11
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
