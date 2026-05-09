; DESCRIPTION: Places a cyan line segment connecting (483, 161) to (321, 85).
; PLAN: r0=483(x1), r1=161(y1), r2=321(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 161
LDI r2, 321
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
