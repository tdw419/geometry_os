; DESCRIPTION: Draws a red line from (379, 168) to (328, 139).
; PLAN: r0=379(x1), r1=168(y1), r2=328(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 168
LDI r2, 328
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
