; DESCRIPTION: Places a green line segment connecting (170, 60) to (221, 26).
; PLAN: r0=170(x1), r1=60(y1), r2=221(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 60
LDI r2, 221
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
