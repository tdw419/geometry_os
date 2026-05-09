; DESCRIPTION: Draws a blue line from (148, 193) to (52, 252).
; PLAN: r0=148(x1), r1=193(y1), r2=52(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 193
LDI r2, 52
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
