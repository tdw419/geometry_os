; DESCRIPTION: Draws a red line from (501, 231) to (473, 129).
; PLAN: r0=501(x1), r1=231(y1), r2=473(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 231
LDI r2, 473
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
