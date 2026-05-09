; DESCRIPTION: Places a cyan line segment connecting (94, 56) to (65, 58).
; PLAN: r0=94(x1), r1=56(y1), r2=65(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 56
LDI r2, 65
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
