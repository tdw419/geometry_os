; DESCRIPTION: Draws a green line from (95, 89) to (222, 12).
; PLAN: r0=95(x1), r1=89(y1), r2=222(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 89
LDI r2, 222
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
