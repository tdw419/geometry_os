; DESCRIPTION: Places a green line segment connecting (201, 152) to (329, 161).
; PLAN: r0=201(x1), r1=152(y1), r2=329(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 152
LDI r2, 329
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
