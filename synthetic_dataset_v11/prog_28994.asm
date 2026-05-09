; DESCRIPTION: Draws a red line from (206, 79) to (26, 71).
; PLAN: r0=206(x1), r1=79(y1), r2=26(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 79
LDI r2, 26
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
