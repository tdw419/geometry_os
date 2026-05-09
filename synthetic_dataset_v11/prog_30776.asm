; DESCRIPTION: Places a blue line segment connecting (177, 242) to (133, 184).
; PLAN: r0=177(x1), r1=242(y1), r2=133(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 242
LDI r2, 133
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
