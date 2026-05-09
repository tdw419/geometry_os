; DESCRIPTION: Places a cyan line segment connecting (419, 26) to (374, 216).
; PLAN: r0=419(x1), r1=26(y1), r2=374(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 26
LDI r2, 374
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
