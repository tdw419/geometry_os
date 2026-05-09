; DESCRIPTION: Draws a red line from (412, 249) to (222, 85).
; PLAN: r0=412(x1), r1=249(y1), r2=222(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 249
LDI r2, 222
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
