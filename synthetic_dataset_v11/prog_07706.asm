; DESCRIPTION: Draws a green line from (114, 185) to (34, 35).
; PLAN: r0=114(x1), r1=185(y1), r2=34(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 185
LDI r2, 34
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
