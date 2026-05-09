; DESCRIPTION: Draws a blue line from (61, 180) to (223, 177).
; PLAN: r0=61(x1), r1=180(y1), r2=223(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 180
LDI r2, 223
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
