; DESCRIPTION: Draws a red line from (339, 179) to (218, 216).
; PLAN: r0=339(x1), r1=179(y1), r2=218(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 179
LDI r2, 218
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
