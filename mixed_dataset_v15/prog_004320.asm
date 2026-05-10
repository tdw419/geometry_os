; DESCRIPTION: Draws a red line from (86, 220) to (379, 246).
; PLAN: r0=86(x1), r1=220(y1), r2=379(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 220
LDI r2, 379
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
