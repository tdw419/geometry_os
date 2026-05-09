; DESCRIPTION: Draws a white line from (182, 145) to (413, 200).
; PLAN: r0=182(x1), r1=145(y1), r2=413(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 145
LDI r2, 413
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
