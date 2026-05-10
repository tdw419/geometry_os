; DESCRIPTION: Draws a blue line from (26, 195) to (277, 191).
; PLAN: r0=26(x1), r1=195(y1), r2=277(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 195
LDI r2, 277
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
