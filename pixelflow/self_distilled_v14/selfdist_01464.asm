; DESCRIPTION: Draws a red line from (195, 33) to (38, 153).
; PLAN: r0=195(x1), r1=33(y1), r2=38(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 33
LDI r2, 38
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
