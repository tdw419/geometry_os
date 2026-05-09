; DESCRIPTION: Places a cyan line segment connecting (233, 131) to (86, 89).
; PLAN: r0=233(x1), r1=131(y1), r2=86(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 131
LDI r2, 86
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
