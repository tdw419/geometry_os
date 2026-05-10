; DESCRIPTION: Draws a red line from (120, 56) to (140, 170).
; PLAN: r0=120(x1), r1=56(y1), r2=140(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 56
LDI r2, 140
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
