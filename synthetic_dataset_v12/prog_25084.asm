; DESCRIPTION: Draws a red line from (178, 136) to (84, 81).
; PLAN: r0=178(x1), r1=136(y1), r2=84(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 136
LDI r2, 84
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
