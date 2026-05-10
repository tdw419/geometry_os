; DESCRIPTION: Draws a blue line from (51, 31) to (176, 180).
; PLAN: r0=51(x1), r1=31(y1), r2=176(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 31
LDI r2, 176
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
