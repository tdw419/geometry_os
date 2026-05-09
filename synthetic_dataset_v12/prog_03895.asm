; DESCRIPTION: Draws a red line from (349, 245) to (138, 206).
; PLAN: r0=349(x1), r1=245(y1), r2=138(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 245
LDI r2, 138
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
