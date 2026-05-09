; DESCRIPTION: Places a cyan line segment connecting (56, 70) to (179, 40).
; PLAN: r0=56(x1), r1=70(y1), r2=179(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 70
LDI r2, 179
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
