; DESCRIPTION: Draws a red line from (65, 140) to (250, 63).
; PLAN: r0=65(x1), r1=140(y1), r2=250(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 140
LDI r2, 250
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
