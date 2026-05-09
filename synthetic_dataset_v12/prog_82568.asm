; DESCRIPTION: Draws a red line from (109, 6) to (191, 207).
; PLAN: r0=109(x1), r1=6(y1), r2=191(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 6
LDI r2, 191
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
