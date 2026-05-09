; DESCRIPTION: Draws a red line from (112, 229) to (32, 161).
; PLAN: r0=112(x1), r1=229(y1), r2=32(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 229
LDI r2, 32
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
