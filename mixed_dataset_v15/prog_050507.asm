; DESCRIPTION: Draws a white line from (179, 102) to (379, 73).
; PLAN: r0=179(x1), r1=102(y1), r2=379(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 102
LDI r2, 379
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
