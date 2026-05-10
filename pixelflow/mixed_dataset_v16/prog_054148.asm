; DESCRIPTION: Places a cyan line segment connecting (435, 118) to (451, 189).
; PLAN: r0=435(x1), r1=118(y1), r2=451(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 118
LDI r2, 451
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
