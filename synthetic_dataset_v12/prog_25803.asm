; DESCRIPTION: Draws a red line from (385, 193) to (486, 69).
; PLAN: r0=385(x1), r1=193(y1), r2=486(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 193
LDI r2, 486
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
