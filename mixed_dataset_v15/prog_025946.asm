; DESCRIPTION: Places a green line segment connecting (393, 36) to (31, 94).
; PLAN: r0=393(x1), r1=36(y1), r2=31(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 36
LDI r2, 31
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
