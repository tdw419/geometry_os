; DESCRIPTION: Draws a red line from (22, 120) to (305, 80).
; PLAN: r0=22(x1), r1=120(y1), r2=305(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 120
LDI r2, 305
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
