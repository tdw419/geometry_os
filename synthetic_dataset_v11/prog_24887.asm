; DESCRIPTION: Places a cyan line segment connecting (72, 211) to (194, 188).
; PLAN: r0=72(x1), r1=211(y1), r2=194(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 211
LDI r2, 194
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
