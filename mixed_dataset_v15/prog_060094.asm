; DESCRIPTION: Places a cyan line segment connecting (426, 78) to (226, 132).
; PLAN: r0=426(x1), r1=78(y1), r2=226(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 78
LDI r2, 226
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
