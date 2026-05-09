; DESCRIPTION: Places a cyan line segment connecting (84, 176) to (227, 226).
; PLAN: r0=84(x1), r1=176(y1), r2=227(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 176
LDI r2, 227
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
