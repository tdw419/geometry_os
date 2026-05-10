; DESCRIPTION: Draws a green line from (484, 158) to (274, 91).
; PLAN: r0=484(x1), r1=158(y1), r2=274(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 158
LDI r2, 274
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
