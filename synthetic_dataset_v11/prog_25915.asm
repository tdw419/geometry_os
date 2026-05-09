; DESCRIPTION: Draws a red line from (216, 105) to (21, 60).
; PLAN: r0=216(x1), r1=105(y1), r2=21(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 105
LDI r2, 21
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
