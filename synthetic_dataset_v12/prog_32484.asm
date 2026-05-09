; DESCRIPTION: Draws a red line from (466, 36) to (302, 164).
; PLAN: r0=466(x1), r1=36(y1), r2=302(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 36
LDI r2, 302
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
