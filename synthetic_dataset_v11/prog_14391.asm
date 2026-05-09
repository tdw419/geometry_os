; DESCRIPTION: Draws a green line from (26, 19) to (194, 77).
; PLAN: r0=26(x1), r1=19(y1), r2=194(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 19
LDI r2, 194
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
