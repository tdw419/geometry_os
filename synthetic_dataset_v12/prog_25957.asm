; DESCRIPTION: Draws a yellow line from (437, 14) to (65, 119).
; PLAN: r0=437(x1), r1=14(y1), r2=65(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 14
LDI r2, 65
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
