; DESCRIPTION: Places a cyan line segment connecting (350, 227) to (309, 3).
; PLAN: r0=350(x1), r1=227(y1), r2=309(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 227
LDI r2, 309
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
