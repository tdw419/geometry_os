; DESCRIPTION: Places a blue line segment connecting (121, 153) to (140, 242).
; PLAN: r0=121(x1), r1=153(y1), r2=140(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 153
LDI r2, 140
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
