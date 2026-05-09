; DESCRIPTION: Draws a blue line from (39, 207) to (91, 112).
; PLAN: r0=39(x1), r1=207(y1), r2=91(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 207
LDI r2, 91
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
