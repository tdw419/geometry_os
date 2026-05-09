; DESCRIPTION: Places a blue line segment connecting (204, 11) to (71, 187).
; PLAN: r0=204(x1), r1=11(y1), r2=71(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 11
LDI r2, 71
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
