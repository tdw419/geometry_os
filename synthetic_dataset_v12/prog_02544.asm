; DESCRIPTION: Places a white line segment connecting (46, 37) to (208, 158).
; PLAN: r0=46(x1), r1=37(y1), r2=208(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 37
LDI r2, 208
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
