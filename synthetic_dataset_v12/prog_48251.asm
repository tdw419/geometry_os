; DESCRIPTION: Draws a red line from (299, 61) to (328, 78).
; PLAN: r0=299(x1), r1=61(y1), r2=328(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 61
LDI r2, 328
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
