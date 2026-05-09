; DESCRIPTION: Draws a red line from (403, 108) to (88, 159).
; PLAN: r0=403(x1), r1=108(y1), r2=88(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 108
LDI r2, 88
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
