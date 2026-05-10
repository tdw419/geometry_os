; DESCRIPTION: Draws a blue line from (8, 33) to (211, 66).
; PLAN: r0=8(x1), r1=33(y1), r2=211(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 33
LDI r2, 211
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
