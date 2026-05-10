; DESCRIPTION: Draws a red line from (13, 81) to (125, 226).
; PLAN: r0=13(x1), r1=81(y1), r2=125(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 81
LDI r2, 125
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
