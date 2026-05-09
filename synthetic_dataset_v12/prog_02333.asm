; DESCRIPTION: Draws a red line from (297, 180) to (115, 83).
; PLAN: r0=297(x1), r1=180(y1), r2=115(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 180
LDI r2, 115
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
