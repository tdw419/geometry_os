; DESCRIPTION: Draws a green line from (186, 46) to (80, 216).
; PLAN: r0=186(x1), r1=46(y1), r2=80(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 46
LDI r2, 80
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
