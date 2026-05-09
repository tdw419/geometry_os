; DESCRIPTION: Draws a red line from (189, 31) to (249, 120).
; PLAN: r0=189(x1), r1=31(y1), r2=249(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 31
LDI r2, 249
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
