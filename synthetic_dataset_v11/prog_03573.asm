; DESCRIPTION: Draws a red line from (205, 221) to (73, 123).
; PLAN: r0=205(x1), r1=221(y1), r2=73(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 221
LDI r2, 73
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
