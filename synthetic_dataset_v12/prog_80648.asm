; DESCRIPTION: Draws a white line from (305, 133) to (62, 217).
; PLAN: r0=305(x1), r1=133(y1), r2=62(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 133
LDI r2, 62
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
