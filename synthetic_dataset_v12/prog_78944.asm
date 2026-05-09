; DESCRIPTION: Places a purple line segment connecting (21, 236) to (281, 45).
; PLAN: r0=21(x1), r1=236(y1), r2=281(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 236
LDI r2, 281
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
