; DESCRIPTION: Places a cyan line segment connecting (94, 89) to (130, 56).
; PLAN: r0=94(x1), r1=89(y1), r2=130(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 89
LDI r2, 130
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
