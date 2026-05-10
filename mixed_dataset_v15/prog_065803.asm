; DESCRIPTION: Draws a red line from (250, 168) to (201, 171).
; PLAN: r0=250(x1), r1=168(y1), r2=201(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 168
LDI r2, 201
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
