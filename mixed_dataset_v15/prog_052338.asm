; DESCRIPTION: Places a cyan line segment connecting (151, 84) to (319, 141).
; PLAN: r0=151(x1), r1=84(y1), r2=319(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 84
LDI r2, 319
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
