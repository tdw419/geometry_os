; DESCRIPTION: Places a blue line segment connecting (177, 140) to (502, 58).
; PLAN: r0=177(x1), r1=140(y1), r2=502(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 140
LDI r2, 502
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
