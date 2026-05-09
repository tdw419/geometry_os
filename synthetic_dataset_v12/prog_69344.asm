; DESCRIPTION: Places a cyan line segment connecting (158, 23) to (155, 221).
; PLAN: r0=158(x1), r1=23(y1), r2=155(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 23
LDI r2, 155
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
