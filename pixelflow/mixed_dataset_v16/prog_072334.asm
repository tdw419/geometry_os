; DESCRIPTION: Draws a red line from (379, 249) to (80, 207).
; PLAN: r0=379(x1), r1=249(y1), r2=80(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 249
LDI r2, 80
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
