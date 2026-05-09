; DESCRIPTION: Places a cyan line segment connecting (18, 18) to (192, 35).
; PLAN: r0=18(x1), r1=18(y1), r2=192(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 18
LDI r2, 192
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
