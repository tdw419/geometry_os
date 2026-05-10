; DESCRIPTION: Places a cyan line segment connecting (94, 229) to (44, 222).
; PLAN: r0=94(x1), r1=229(y1), r2=44(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 229
LDI r2, 44
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
