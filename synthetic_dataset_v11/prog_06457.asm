; DESCRIPTION: Draws a blue line from (171, 169) to (153, 173).
; PLAN: r0=171(x1), r1=169(y1), r2=153(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 169
LDI r2, 153
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
