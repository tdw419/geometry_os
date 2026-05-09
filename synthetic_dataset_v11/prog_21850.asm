; DESCRIPTION: Draws a white line from (149, 136) to (131, 76).
; PLAN: r0=149(x1), r1=136(y1), r2=131(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 136
LDI r2, 131
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
