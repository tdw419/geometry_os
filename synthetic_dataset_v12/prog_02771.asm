; DESCRIPTION: Draws a white line from (143, 131) to (118, 205).
; PLAN: r0=143(x1), r1=131(y1), r2=118(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 131
LDI r2, 118
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
