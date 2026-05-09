; DESCRIPTION: Places a green line segment connecting (184, 99) to (27, 85).
; PLAN: r0=184(x1), r1=99(y1), r2=27(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 99
LDI r2, 27
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
