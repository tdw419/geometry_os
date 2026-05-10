; DESCRIPTION: Places a cyan line segment connecting (339, 171) to (192, 86).
; PLAN: r0=339(x1), r1=171(y1), r2=192(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 171
LDI r2, 192
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
