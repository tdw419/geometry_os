; DESCRIPTION: Draws a red line from (403, 99) to (471, 198).
; PLAN: r0=403(x1), r1=99(y1), r2=471(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 99
LDI r2, 471
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
