; DESCRIPTION: Places a green line segment connecting (486, 167) to (216, 182).
; PLAN: r0=486(x1), r1=167(y1), r2=216(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 167
LDI r2, 216
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
