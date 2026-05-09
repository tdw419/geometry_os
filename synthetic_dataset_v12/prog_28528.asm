; DESCRIPTION: Renders a blue line between points (309, 118) and (231, 186).
; PLAN: r0=309(x1), r1=118(y1), r2=231(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 118
LDI r2, 231
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
