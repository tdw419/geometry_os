; DESCRIPTION: Draws a red line from (313, 198) to (71, 47).
; PLAN: r0=313(x1), r1=198(y1), r2=71(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 198
LDI r2, 71
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
