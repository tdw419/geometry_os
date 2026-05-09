; DESCRIPTION: Places a green line segment connecting (191, 117) to (60, 232).
; PLAN: r0=191(x1), r1=117(y1), r2=60(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 117
LDI r2, 60
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
