; DESCRIPTION: Draws a red line from (140, 191) to (103, 229).
; PLAN: r0=140(x1), r1=191(y1), r2=103(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 191
LDI r2, 103
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
