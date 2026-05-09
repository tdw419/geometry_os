; DESCRIPTION: Places a green line segment connecting (46, 115) to (130, 31).
; PLAN: r0=46(x1), r1=115(y1), r2=130(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 115
LDI r2, 130
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
