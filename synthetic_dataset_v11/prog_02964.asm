; DESCRIPTION: Places a green line segment connecting (148, 187) to (60, 14).
; PLAN: r0=148(x1), r1=187(y1), r2=60(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 187
LDI r2, 60
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
