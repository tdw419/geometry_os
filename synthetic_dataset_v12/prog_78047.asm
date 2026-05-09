; DESCRIPTION: Draws a green line from (292, 51) to (169, 183).
; PLAN: r0=292(x1), r1=51(y1), r2=169(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 51
LDI r2, 169
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
