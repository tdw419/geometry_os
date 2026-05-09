; DESCRIPTION: Draws a blue line from (503, 251) to (26, 187).
; PLAN: r0=503(x1), r1=251(y1), r2=26(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 251
LDI r2, 26
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
