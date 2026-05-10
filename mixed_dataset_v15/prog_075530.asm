; DESCRIPTION: Draws a red line from (205, 194) to (54, 168).
; PLAN: r0=205(x1), r1=194(y1), r2=54(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 194
LDI r2, 54
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
