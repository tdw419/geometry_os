; DESCRIPTION: Draws a red line from (212, 16) to (299, 249).
; PLAN: r0=212(x1), r1=16(y1), r2=299(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 16
LDI r2, 299
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
