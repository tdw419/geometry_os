; DESCRIPTION: Draws a white line from (423, 184) to (238, 126).
; PLAN: r0=423(x1), r1=184(y1), r2=238(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 184
LDI r2, 238
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
