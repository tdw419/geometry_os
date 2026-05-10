; DESCRIPTION: Draws a red line from (164, 87) to (302, 71).
; PLAN: r0=164(x1), r1=87(y1), r2=302(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 87
LDI r2, 302
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
