; DESCRIPTION: Draws a yellow line from (70, 81) to (483, 11).
; PLAN: r0=70(x1), r1=81(y1), r2=483(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 81
LDI r2, 483
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
