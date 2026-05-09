; DESCRIPTION: Draws a red line from (378, 138) to (359, 180).
; PLAN: r0=378(x1), r1=138(y1), r2=359(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 138
LDI r2, 359
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
