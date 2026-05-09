; DESCRIPTION: Draws a white line from (118, 184) to (95, 107).
; PLAN: r0=118(x1), r1=184(y1), r2=95(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 184
LDI r2, 95
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
