; DESCRIPTION: Draws a red line from (311, 28) to (396, 186).
; PLAN: r0=311(x1), r1=28(y1), r2=396(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 28
LDI r2, 396
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
