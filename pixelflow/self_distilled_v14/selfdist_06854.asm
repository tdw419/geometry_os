; DESCRIPTION: Draws a red line from (283, 51) to (127, 35).
; PLAN: r0=283(x1), r1=51(y1), r2=127(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 51
LDI r2, 127
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
