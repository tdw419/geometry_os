; DESCRIPTION: Draws a green line from (70, 216) to (12, 118).
; PLAN: r0=70(x1), r1=216(y1), r2=12(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 216
LDI r2, 12
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
