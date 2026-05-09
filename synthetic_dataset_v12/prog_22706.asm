; DESCRIPTION: Draws a red line from (283, 115) to (413, 164).
; PLAN: r0=283(x1), r1=115(y1), r2=413(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 115
LDI r2, 413
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
