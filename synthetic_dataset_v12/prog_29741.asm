; DESCRIPTION: Places a cyan line segment connecting (373, 220) to (438, 218).
; PLAN: r0=373(x1), r1=220(y1), r2=438(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 220
LDI r2, 438
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
