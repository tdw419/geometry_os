; DESCRIPTION: Draws a blue line from (478, 82) to (51, 236).
; PLAN: r0=478(x1), r1=82(y1), r2=51(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 82
LDI r2, 51
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
