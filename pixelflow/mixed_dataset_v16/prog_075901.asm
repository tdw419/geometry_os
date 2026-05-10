; DESCRIPTION: Places a cyan line segment connecting (426, 232) to (347, 119).
; PLAN: r0=426(x1), r1=232(y1), r2=347(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 232
LDI r2, 347
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
