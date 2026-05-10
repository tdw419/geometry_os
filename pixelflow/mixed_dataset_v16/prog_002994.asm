; DESCRIPTION: Places a cyan line segment connecting (88, 160) to (292, 99).
; PLAN: r0=88(x1), r1=160(y1), r2=292(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 160
LDI r2, 292
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
