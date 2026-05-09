; DESCRIPTION: Places a cyan line segment connecting (253, 131) to (23, 118).
; PLAN: r0=253(x1), r1=131(y1), r2=23(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 131
LDI r2, 23
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
