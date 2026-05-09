; DESCRIPTION: Draws a green line from (471, 180) to (153, 85).
; PLAN: r0=471(x1), r1=180(y1), r2=153(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 180
LDI r2, 153
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
