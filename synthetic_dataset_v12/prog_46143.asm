; DESCRIPTION: Draws a yellow line from (186, 133) to (473, 76).
; PLAN: r0=186(x1), r1=133(y1), r2=473(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 133
LDI r2, 473
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
