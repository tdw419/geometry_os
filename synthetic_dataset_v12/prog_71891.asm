; DESCRIPTION: Draws a blue line from (125, 142) to (66, 206).
; PLAN: r0=125(x1), r1=142(y1), r2=66(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 142
LDI r2, 66
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
