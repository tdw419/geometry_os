; DESCRIPTION: Draws a red line from (140, 87) to (123, 87).
; PLAN: r0=140(x1), r1=87(y1), r2=123(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 87
LDI r2, 123
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
