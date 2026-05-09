; DESCRIPTION: Places a cyan line segment connecting (347, 152) to (201, 137).
; PLAN: r0=347(x1), r1=152(y1), r2=201(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 152
LDI r2, 201
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
