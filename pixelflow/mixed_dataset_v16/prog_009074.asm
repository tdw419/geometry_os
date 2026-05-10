; DESCRIPTION: Places a yellow line segment connecting (483, 45) to (260, 63).
; PLAN: r0=483(x1), r1=45(y1), r2=260(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 45
LDI r2, 260
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
