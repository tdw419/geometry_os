; DESCRIPTION: Places a green line segment connecting (191, 39) to (250, 189).
; PLAN: r0=191(x1), r1=39(y1), r2=250(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 39
LDI r2, 250
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
