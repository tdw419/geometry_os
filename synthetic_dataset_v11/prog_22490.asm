; DESCRIPTION: Places a white line segment connecting (209, 158) to (68, 204).
; PLAN: r0=209(x1), r1=158(y1), r2=68(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 158
LDI r2, 68
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
