; DESCRIPTION: Draws a red line from (445, 180) to (413, 129).
; PLAN: r0=445(x1), r1=180(y1), r2=413(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 180
LDI r2, 413
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
