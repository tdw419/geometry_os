; DESCRIPTION: Draws a green line from (1, 118) to (62, 221).
; PLAN: r0=1(x1), r1=118(y1), r2=62(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 118
LDI r2, 62
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
