; DESCRIPTION: Places a cyan line segment connecting (158, 7) to (2, 207).
; PLAN: r0=158(x1), r1=7(y1), r2=2(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 7
LDI r2, 2
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
