; DESCRIPTION: Draws a red line from (280, 135) to (133, 148).
; PLAN: r0=280(x1), r1=135(y1), r2=133(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 135
LDI r2, 133
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
