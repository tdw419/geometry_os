; DESCRIPTION: Places a green line segment connecting (71, 33) to (216, 184).
; PLAN: r0=71(x1), r1=33(y1), r2=216(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 33
LDI r2, 216
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
