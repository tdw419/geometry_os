; DESCRIPTION: Places a cyan line segment connecting (426, 110) to (52, 145).
; PLAN: r0=426(x1), r1=110(y1), r2=52(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 110
LDI r2, 52
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
