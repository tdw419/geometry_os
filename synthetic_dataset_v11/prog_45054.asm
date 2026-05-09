; DESCRIPTION: Draws a red line from (51, 220) to (133, 239).
; PLAN: r0=51(x1), r1=220(y1), r2=133(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 220
LDI r2, 133
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
