; DESCRIPTION: Places a cyan line segment connecting (405, 84) to (312, 80).
; PLAN: r0=405(x1), r1=84(y1), r2=312(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 84
LDI r2, 312
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
