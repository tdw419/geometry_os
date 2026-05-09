; DESCRIPTION: Draws a white line from (312, 221) to (11, 82).
; PLAN: r0=312(x1), r1=221(y1), r2=11(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 221
LDI r2, 11
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
