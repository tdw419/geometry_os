; DESCRIPTION: Places a cyan line segment connecting (1, 28) to (119, 20).
; PLAN: r0=1(x1), r1=28(y1), r2=119(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 28
LDI r2, 119
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
