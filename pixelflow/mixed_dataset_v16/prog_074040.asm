; DESCRIPTION: Draws a green line from (216, 9) to (250, 183).
; PLAN: r0=216(x1), r1=9(y1), r2=250(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 9
LDI r2, 250
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
