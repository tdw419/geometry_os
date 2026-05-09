; DESCRIPTION: Places a cyan line segment connecting (231, 219) to (187, 129).
; PLAN: r0=231(x1), r1=219(y1), r2=187(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 219
LDI r2, 187
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
