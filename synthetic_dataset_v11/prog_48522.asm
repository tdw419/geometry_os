; DESCRIPTION: Places a cyan line segment connecting (38, 140) to (83, 18).
; PLAN: r0=38(x1), r1=140(y1), r2=83(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 140
LDI r2, 83
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
