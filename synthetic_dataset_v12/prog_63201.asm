; DESCRIPTION: Draws a green line from (205, 51) to (204, 180).
; PLAN: r0=205(x1), r1=51(y1), r2=204(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 51
LDI r2, 204
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
