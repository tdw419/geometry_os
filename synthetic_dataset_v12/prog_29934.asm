; DESCRIPTION: Places a cyan line segment connecting (12, 131) to (99, 31).
; PLAN: r0=12(x1), r1=131(y1), r2=99(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 131
LDI r2, 99
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
