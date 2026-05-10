; DESCRIPTION: Draws a blue line from (109, 252) to (399, 81).
; PLAN: r0=109(x1), r1=252(y1), r2=399(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 252
LDI r2, 399
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
