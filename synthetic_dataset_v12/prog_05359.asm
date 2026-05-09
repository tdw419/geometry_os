; DESCRIPTION: Places a cyan line segment connecting (451, 192) to (56, 127).
; PLAN: r0=451(x1), r1=192(y1), r2=56(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 192
LDI r2, 56
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
