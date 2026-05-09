; DESCRIPTION: Places a green line segment connecting (9, 96) to (231, 226).
; PLAN: r0=9(x1), r1=96(y1), r2=231(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 96
LDI r2, 231
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
