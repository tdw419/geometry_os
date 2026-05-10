; DESCRIPTION: Places a cyan line segment connecting (88, 100) to (428, 202).
; PLAN: r0=88(x1), r1=100(y1), r2=428(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 100
LDI r2, 428
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
