; DESCRIPTION: Places a green line segment connecting (66, 197) to (115, 112).
; PLAN: r0=66(x1), r1=197(y1), r2=115(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 197
LDI r2, 115
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
