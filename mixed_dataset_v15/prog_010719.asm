; DESCRIPTION: Draws a blue line from (16, 112) to (95, 181).
; PLAN: r0=16(x1), r1=112(y1), r2=95(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 112
LDI r2, 95
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
