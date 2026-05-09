; DESCRIPTION: Draws a red line from (229, 93) to (172, 252).
; PLAN: r0=229(x1), r1=93(y1), r2=172(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 93
LDI r2, 172
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
