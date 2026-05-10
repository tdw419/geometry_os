; DESCRIPTION: Draws a blue line from (507, 95) to (284, 169).
; PLAN: r0=507(x1), r1=95(y1), r2=284(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 95
LDI r2, 284
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
