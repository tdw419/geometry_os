; DESCRIPTION: Draws a green line from (379, 131) to (31, 21).
; PLAN: r0=379(x1), r1=131(y1), r2=31(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 131
LDI r2, 31
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
