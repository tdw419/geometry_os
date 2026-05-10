; DESCRIPTION: Draws a red line from (311, 218) to (316, 215).
; PLAN: r0=311(x1), r1=218(y1), r2=316(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 218
LDI r2, 316
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
