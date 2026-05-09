; DESCRIPTION: Draws a white line from (244, 147) to (317, 51).
; PLAN: r0=244(x1), r1=147(y1), r2=317(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 147
LDI r2, 317
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
