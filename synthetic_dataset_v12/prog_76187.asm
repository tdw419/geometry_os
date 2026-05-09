; DESCRIPTION: Draws a red line from (219, 81) to (162, 125).
; PLAN: r0=219(x1), r1=81(y1), r2=162(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 81
LDI r2, 162
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
