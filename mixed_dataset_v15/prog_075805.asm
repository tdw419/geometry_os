; DESCRIPTION: Draws a red line from (155, 38) to (19, 225).
; PLAN: r0=155(x1), r1=38(y1), r2=19(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 38
LDI r2, 19
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
