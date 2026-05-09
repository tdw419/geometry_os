; DESCRIPTION: Places a cyan line segment connecting (10, 119) to (30, 66).
; PLAN: r0=10(x1), r1=119(y1), r2=30(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 119
LDI r2, 30
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
