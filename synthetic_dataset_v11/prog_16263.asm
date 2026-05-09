; DESCRIPTION: Draws a blue line from (183, 14) to (44, 115).
; PLAN: r0=183(x1), r1=14(y1), r2=44(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 14
LDI r2, 44
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
