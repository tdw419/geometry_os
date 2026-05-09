; DESCRIPTION: Places a green line segment connecting (43, 196) to (11, 66).
; PLAN: r0=43(x1), r1=196(y1), r2=11(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 196
LDI r2, 11
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
