; DESCRIPTION: Draws a red line from (243, 158) to (164, 72).
; PLAN: r0=243(x1), r1=158(y1), r2=164(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 158
LDI r2, 164
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
