; DESCRIPTION: Draws a green line from (15, 169) to (429, 95).
; PLAN: r0=15(x1), r1=169(y1), r2=429(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 169
LDI r2, 429
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
