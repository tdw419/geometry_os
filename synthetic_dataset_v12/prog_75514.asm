; DESCRIPTION: Places a red line segment connecting (153, 44) to (79, 180).
; PLAN: r0=153(x1), r1=44(y1), r2=79(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 44
LDI r2, 79
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
