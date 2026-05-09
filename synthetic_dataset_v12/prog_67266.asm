; DESCRIPTION: Draws a red line from (230, 20) to (134, 33).
; PLAN: r0=230(x1), r1=20(y1), r2=134(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 20
LDI r2, 134
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
