; DESCRIPTION: Draws a blue line from (133, 242) to (213, 169).
; PLAN: r0=133(x1), r1=242(y1), r2=213(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 242
LDI r2, 213
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
