; DESCRIPTION: Draws a red line from (210, 116) to (89, 180).
; PLAN: r0=210(x1), r1=116(y1), r2=89(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 116
LDI r2, 89
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
