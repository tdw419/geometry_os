; DESCRIPTION: Places a green line segment connecting (413, 176) to (188, 8).
; PLAN: r0=413(x1), r1=176(y1), r2=188(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 176
LDI r2, 188
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
