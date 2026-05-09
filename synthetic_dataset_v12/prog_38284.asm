; DESCRIPTION: Places a cyan line segment connecting (62, 5) to (122, 77).
; PLAN: r0=62(x1), r1=5(y1), r2=122(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 5
LDI r2, 122
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
