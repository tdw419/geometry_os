; DESCRIPTION: Places a cyan line segment connecting (10, 145) to (7, 229).
; PLAN: r0=10(x1), r1=145(y1), r2=7(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 145
LDI r2, 7
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
