; DESCRIPTION: Places a cyan line segment connecting (326, 97) to (250, 5).
; PLAN: r0=326(x1), r1=97(y1), r2=250(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 97
LDI r2, 250
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
