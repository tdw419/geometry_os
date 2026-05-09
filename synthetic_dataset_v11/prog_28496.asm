; DESCRIPTION: Places a cyan line segment connecting (1, 54) to (231, 191).
; PLAN: r0=1(x1), r1=54(y1), r2=231(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 54
LDI r2, 231
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
