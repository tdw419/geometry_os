; DESCRIPTION: Draws a blue line from (222, 176) to (33, 95).
; PLAN: r0=222(x1), r1=176(y1), r2=33(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 176
LDI r2, 33
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
