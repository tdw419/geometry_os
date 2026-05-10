; DESCRIPTION: Places a cyan line segment connecting (432, 36) to (315, 119).
; PLAN: r0=432(x1), r1=36(y1), r2=315(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 36
LDI r2, 315
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
