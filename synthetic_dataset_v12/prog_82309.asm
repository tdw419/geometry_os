; DESCRIPTION: Places a orange line segment connecting (126, 201) to (319, 236).
; PLAN: r0=126(x1), r1=201(y1), r2=319(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 201
LDI r2, 319
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
