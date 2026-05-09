; DESCRIPTION: Places a cyan line segment connecting (274, 119) to (212, 229).
; PLAN: r0=274(x1), r1=119(y1), r2=212(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 119
LDI r2, 212
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
