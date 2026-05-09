; DESCRIPTION: Draws a red line from (184, 236) to (301, 161).
; PLAN: r0=184(x1), r1=236(y1), r2=301(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 236
LDI r2, 301
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
