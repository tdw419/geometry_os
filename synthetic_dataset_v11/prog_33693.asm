; DESCRIPTION: Places a green line segment connecting (176, 200) to (158, 27).
; PLAN: r0=176(x1), r1=200(y1), r2=158(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 200
LDI r2, 158
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
