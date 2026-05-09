; DESCRIPTION: Places a green line segment connecting (140, 161) to (104, 91).
; PLAN: r0=140(x1), r1=161(y1), r2=104(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 161
LDI r2, 104
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
