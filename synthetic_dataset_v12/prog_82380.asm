; DESCRIPTION: Places a green line segment connecting (132, 193) to (290, 45).
; PLAN: r0=132(x1), r1=193(y1), r2=290(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 193
LDI r2, 290
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
