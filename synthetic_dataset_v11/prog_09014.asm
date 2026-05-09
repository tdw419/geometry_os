; DESCRIPTION: Draws a white line from (155, 231) to (121, 51).
; PLAN: r0=155(x1), r1=231(y1), r2=121(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 231
LDI r2, 121
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
