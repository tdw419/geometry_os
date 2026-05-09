; DESCRIPTION: Places a yellow line segment connecting (355, 240) to (204, 36).
; PLAN: r0=355(x1), r1=240(y1), r2=204(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 240
LDI r2, 204
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
