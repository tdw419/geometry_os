; DESCRIPTION: Places a cyan line segment connecting (471, 91) to (160, 232).
; PLAN: r0=471(x1), r1=91(y1), r2=160(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 91
LDI r2, 160
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
