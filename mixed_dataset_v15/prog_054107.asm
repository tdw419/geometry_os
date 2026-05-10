; DESCRIPTION: Places a cyan line segment connecting (94, 216) to (373, 87).
; PLAN: r0=94(x1), r1=216(y1), r2=373(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 216
LDI r2, 373
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
