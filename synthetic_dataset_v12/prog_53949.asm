; DESCRIPTION: Places a magenta line segment connecting (329, 211) to (210, 35).
; PLAN: r0=329(x1), r1=211(y1), r2=210(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 211
LDI r2, 210
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
