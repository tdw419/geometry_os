; DESCRIPTION: Draws a blue line from (90, 91) to (81, 112).
; PLAN: r0=90(x1), r1=91(y1), r2=81(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 91
LDI r2, 81
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
