; DESCRIPTION: Draws a red line from (205, 61) to (233, 13).
; PLAN: r0=205(x1), r1=61(y1), r2=233(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 61
LDI r2, 233
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
