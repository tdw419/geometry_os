; DESCRIPTION: Draws a red line from (501, 79) to (230, 20).
; PLAN: r0=501(x1), r1=79(y1), r2=230(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 79
LDI r2, 230
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
