; DESCRIPTION: Draws a red line from (22, 61) to (155, 113).
; PLAN: r0=22(x1), r1=61(y1), r2=155(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 61
LDI r2, 155
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
