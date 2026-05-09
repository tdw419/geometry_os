; DESCRIPTION: Places a cyan line segment connecting (234, 6) to (188, 188).
; PLAN: r0=234(x1), r1=6(y1), r2=188(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 6
LDI r2, 188
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
