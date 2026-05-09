; DESCRIPTION: Places a green line segment connecting (130, 161) to (107, 132).
; PLAN: r0=130(x1), r1=161(y1), r2=107(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 161
LDI r2, 107
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
