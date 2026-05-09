; DESCRIPTION: Draws a red line from (120, 47) to (96, 229).
; PLAN: r0=120(x1), r1=47(y1), r2=96(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 47
LDI r2, 96
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
