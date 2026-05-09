; DESCRIPTION: Places a green line segment connecting (252, 73) to (420, 191).
; PLAN: r0=252(x1), r1=73(y1), r2=420(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 73
LDI r2, 420
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
