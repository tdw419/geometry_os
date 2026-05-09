; DESCRIPTION: Places a green line segment connecting (107, 168) to (129, 221).
; PLAN: r0=107(x1), r1=168(y1), r2=129(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 168
LDI r2, 129
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
