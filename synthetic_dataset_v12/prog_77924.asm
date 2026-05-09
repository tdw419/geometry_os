; DESCRIPTION: Draws a red line from (161, 71) to (29, 75).
; PLAN: r0=161(x1), r1=71(y1), r2=29(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 71
LDI r2, 29
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
