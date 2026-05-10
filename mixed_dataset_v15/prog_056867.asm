; DESCRIPTION: Draws a blue line from (393, 118) to (246, 91).
; PLAN: r0=393(x1), r1=118(y1), r2=246(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 118
LDI r2, 246
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
