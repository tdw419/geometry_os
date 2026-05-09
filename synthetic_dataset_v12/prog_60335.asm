; DESCRIPTION: Draws a blue line from (425, 4) to (134, 180).
; PLAN: r0=425(x1), r1=4(y1), r2=134(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 4
LDI r2, 134
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
