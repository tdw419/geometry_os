; DESCRIPTION: Draws a blue line from (107, 204) to (226, 23).
; PLAN: r0=107(x1), r1=204(y1), r2=226(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 204
LDI r2, 226
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
