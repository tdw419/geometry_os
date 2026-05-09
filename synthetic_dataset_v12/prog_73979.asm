; DESCRIPTION: Places a green line segment connecting (283, 36) to (413, 101).
; PLAN: r0=283(x1), r1=36(y1), r2=413(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 36
LDI r2, 413
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
